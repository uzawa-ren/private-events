class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, foreign_key: :creator_id

  has_many :attendances, foreign_key: :attendee_id
  has_many :attended_events, through: :attendances, class_name: "Event", foreign_key: :attendee_id, source: :event
end
