class Club < ApplicationRecord
  belongs_to :user
  has_many :photos
  has_many :reservations

  validates :club_name, presence: true, length:{maximum: 75}
  validates :summary, presence:true, length: {maximum: 600}
  validates :address, presence: true
  validates :court_number, presence: true
  validates :place_number, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

end
