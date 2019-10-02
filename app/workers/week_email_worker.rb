class WeekEmailWorker
  include Sidekiq::Worker
  require 'sidekiq-scheduler'

  def perform
    @user = User.find_by id: '5'
    UserMailer.week_email(@user).deliver
  end
end
