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

  # Save users last job
  User.all.each(&:save_last_jobs)

  # Reset jobs user and tasks
  Job.update_all(user_id: nil)
  Task.update_all(complete: false)

  # Assign new jobs
  job_ids = Job.all.pluck(:id)
  User.all.each do |user|
    job_id = job_ids.sample
    while user.last_jobs.include?(job_id)
      job_id = job_ids.sample
    end
    Job.find(job_id).update_attribute(:user_id, user.id)
    job_ids.delete(job_id)
  end
end
