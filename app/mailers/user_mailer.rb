class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user

    mail(   :to      => @user.email,
            :subject => "Welcome"
    )
  end

  def week_email(user)
    puts "Si entro xd"
    mail(   :to      => user.email,
      :subject => "WeeklyEmail"
    )
  end
end
