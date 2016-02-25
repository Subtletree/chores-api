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

class JobSerializer < ActiveModel::Serializer

  attributes :id, :name, :complete, :active

  has_many :tasks
  belongs_to :user
end
