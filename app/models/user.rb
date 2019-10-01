class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :lists, dependent: :destroy
  has_one_attached :profile_photo

  after_create :welcome_email

  def welcome_email
    UserMailerJob.set(wait: 1.minute).perform_later(self)
  end
end
