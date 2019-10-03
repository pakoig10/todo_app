class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user

    mail(
      :to      => @user.email,
      :subject => "Welcome"
    )
  end

  def week_email(user)
    puts "Si entro xd"
    mail(
      :to => 'egh1795@gmail.com',
      :subject => "WeeklyEmail"
    )
  end
end
