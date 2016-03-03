class UserMailer < ApplicationMailer

  def new_job_email(user)
    @user = user
    mail(to: user.email,
         subject: "New Job: #{user.jobs.first.name}")
  end

  def weekend_reminder_email(user)
    @user = user
    mail(to: user.email,
         subject: "2 days left to clean the #{user.jobs.first.name}")
  end

  def locked_email(user, check_user)
    @user = user
    @check_user = check_user
    mail(to: user.email,
         subject: "Bandwidth throttled!")
  end

  def unlocked_email(user)
    @user = user
    mail(to: user.email,
         subject: "Your bandwidth is unlocked!")
  end

  def unlock_key_email(user, check_user, lock_key)
    @user = user
    @check_user = check_user
    @lock_key = lock_key
    mail(to: check_user.email,
         subject: "Unlock key for #{@user.name}")
  end




end
