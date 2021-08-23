class Club < ApplicationRecord
  belongs_to :user
  has_many :photos

  validates :club_name, presence: true, length:{maximum: 75}
  validates :summary, presence:true, length: {maximum: 600}
  validates :address, presence: true
  validates :court_number, presence: true
  validates :place_number, presence: true

end
