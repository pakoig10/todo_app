class UserMailer < ApplicationMailer
  def welcome_email(user_id)
    @user = user_id

    mail(   :to      => @user.email,
            :subject => "Welcome"
    )
  end
end
