# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  last_jobs  :text             default([]), is an Array
#  ip_range   :string
#  locked     :boolean          default(FALSE)
#  lock_key   :string
#

class User < ApplicationRecord
  has_many :jobs

  require 'tomato'
  include Tomato

  def save_last_jobs
    self.update_attribute(:last_jobs, self.jobs.pluck(:id))
  end

  def lock!
    self.update_attributes(locked: true, lock_key: SecureRandom.urlsafe_base64.first(5))
    # todo: send email with key
    # todo: send email notifying about bandwidth
  end

  def unlock!
    self.update_attributes(locked: false, lock_key: nil)
    update_router_locks
    # todo: send email notifying about bandwidth
  end

end
