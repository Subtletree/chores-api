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
class BandwidthLocksController < ApplicationController

  # GET /jobs
  def index
    @bandwidth_locks = BandwidthLock.includes(:user).all

    render json: @bandwidth_locks, include: ['user']
  end

  def unlock
    @bandwidth_lock = BandwidthLock.find(params[:id])
    if @bandwidth_lock.lock_key == params[:lock_key] && @bandwidth_lock.destroy
      render status: 200
    else
      #@bandwidth_lock.errors.add(:lock_key, 'is not valid')
      render json: 'Invalid lock key', status: :unauthorized
    end
  end

end
