# == Schema Information
#
# Table name: bandwidth_locks
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  lock_key   :string
#

class BandwidthLock < ApplicationRecord
  belongs_to :user

  require 'tomato'
  include Tomato

  before_create :generate_lock_key
  after_create :send_lock_emails
  after_destroy :send_unlock_email

  def generate_lock_key
    self.lock_key = SecureRandom.urlsafe_base64.first(5)
  end

  def send_lock_emails
    check_user = random_user
    UserMailer.locked_email(self.user, check_user).deliver
    UserMailer.unlock_key_email(self.user, check_user, self.lock_key).deliver
  end

  def send_unlock_email
    update_router_locks
    UserMailer.unlocked_email(self.user).deliver
  end

  def random_user
    User.find((User.pluck(:id) - [self.user_id]).sample)
  end
end
