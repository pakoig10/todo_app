class WeekEmailJob < ApplicationJob
  queue_as :scheduler

  def perform
    print "Se encoló"
    @user = User.find_by id: '5'
    UserMailer.week_email(@user)
  end
end
