# == Schema Information
#
# Table name: jobs
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  active     :boolean          default(FALSE)
#  overdue    :boolean          default(FALSE)
#

class Job < ApplicationRecord

  has_many :tasks, dependent: :destroy
  belongs_to :user, optional: true

  # Checks if jobs tasks have been completed
  def complete
    self.tasks.pluck(:complete).exclude?(false)
  end
end
