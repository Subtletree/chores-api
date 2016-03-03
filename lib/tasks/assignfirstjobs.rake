desc "Gives each user their first job"
task :assignfirstjobs => :environment do
  job_ids = Job.pluck(:id) - [Job.find_by_name('Lawns').id]
  user_ids = User.pluck(:id).shuffle

  job_ids.each do |job_id|
    Job.find(job_id).update_attributes(active: true, user_id: user_ids.first)
    user_ids.delete(user_ids.first)
  end
  User.all.each do |user|
    UserMailer.new_job_email(user).deliver
  end
end
