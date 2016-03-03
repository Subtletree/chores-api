require 'tomato'
include Tomato

desc "Assigns a job to each user"
task :assignjobs => :environment do

  # Set users who did not complete their jobs to locked
  Job.where(active: true).each do |job|
    if !job.complete
      job.user.lock!
    end
  end

  # send request to router to set bandwidth limits
  update_router_locks

  # Old assignment hash
  old_assignments = {}
  User.all.each do |user|
    old_assignments[user.id] = user.jobs.any? ? user.jobs.first.id: ''
  end

  # Get job ids for this week
  job_ids_original = Job.all.pluck(:id)
  job_ids_original -= Job.where(active: true, fortnightly: true).pluck(:id)

  # Reset jobs user, active and tasks
  Job.update_all(user_id: nil, active: false)
  Task.update_all(complete: false)

  new_assignments(job_ids_original, old_assignments).each do |user, job|
    Job.find(job).update_attributes(active: true, user_id: user)
  end

  User.all.each do |user|
    UserMailer.new_job_email(user).deliver
  end

end

def new_assignments(job_ids_original, old_assignments)
  # New assignment hash
  temp_new_assignments = {}
  until new_non_repeated_jobs?(temp_new_assignments, old_assignments)
    temp_new_assignments = shuffle_users_jobs(job_ids_original)
  end
  temp_new_assignments
end

def shuffle_users_jobs(job_ids_original)
  job_ids = job_ids_original.dup
  new_job_hash = {}
  User.all.each do |user|

    job = job_ids.sample
    new_job_hash[user.id] = job
    job_ids.delete(job)
  end
  return new_job_hash
end

# Check that all users have new jobs, not repeated
def new_non_repeated_jobs?(temp_new_assignments, old_assignments)
  return false if temp_new_assignments.empty?
  non_repeated = true
  temp_new_assignments.each do |user, job|
    if old_assignments[user] == job
      non_repeated = false
    end
  end
  non_repeated
end
