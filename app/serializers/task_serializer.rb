# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  name       :string
#  complete   :boolean          default(FALSE)
#  job_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TaskSerializer < ActiveModel::Serializer

  attributes :id, :name, :complete

end
