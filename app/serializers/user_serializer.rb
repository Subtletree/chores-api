# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  ip_range   :string
#  locked     :boolean          default(FALSE)
#

class UserSerializer < ActiveModel::Serializer

  attributes :id, :name, :email, :locked
end
