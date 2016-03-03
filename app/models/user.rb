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

class User < ApplicationRecord
  has_many :jobs
  has_one :bandwidth_lock

  def incomplete_jobs?
    incomplete = false
    self.jobs.each do |job|
      incomplete = true if !job.complete
    end
    incomplete
  end

  def lock!
    if self.bandwidth_lock.present?
      self.bandwidth_lock.delete
    end

    self.create_bandwidth_lock

  end

end
