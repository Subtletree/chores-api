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

require 'test_helper'

class BandwidthLockTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
