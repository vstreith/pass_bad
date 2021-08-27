class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :fullname, presence:true, length: {maximum: 50}

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/default_image.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_many :clubs
  has_many :reservations

  before_create :increment_premium

  def increment_premium
    if premium_until.nil? || (premium_until < Date.today)
      self.premium_until = Date.today
    end
    self.premium_until += 1.month
  end

end
