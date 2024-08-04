class Event < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true
  validates :date, presence: true

  belongs_to :creator, class_name: "User"

  has_many :attendances
  has_many :attendees, through: :attendances, class_name: "User"

  scope :past, -> { where("date < ?", Time.now).order(date: :desc) }
  scope :future, -> { where("date > ?", Time.now).order(date: :desc) }
end
