desc "Sends reminder email if job is not complete"
task :emailreminder => :environment do
  User.all.each do |user|
    UserMailer.weekend_reminder_email(user).deliver if user.incomplete_jobs?
  end
end
