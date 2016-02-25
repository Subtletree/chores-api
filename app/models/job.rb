# == Schema Information
#
# Table name: jobs
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  complete   :boolean
#  user_id    :integer
#  active     :boolean          default(FALSE)
#

class Job < ApplicationRecord

  has_many :tasks, dependent: :destroy
  belongs_to :user, optional: true
end
