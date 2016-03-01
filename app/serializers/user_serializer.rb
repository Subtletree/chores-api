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

class UserSerializer < ActiveModel::Serializer

  attributes :id, :name, :email, :locked
end
