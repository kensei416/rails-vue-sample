class User < ApplicationRecord
  has_many :categories, dependent: :destroy
  before_save :prepare_save
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format:     { with: VALID_EMAIL_REGEX }, uniqueness: true
  VALID_USER_ID_REGEX = /\A[a-z0-9]+\Z/
  validates :user_id, presence: true, length: { maximum: 14 } , format: { with: VALID_USER_ID_REGEX }, uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
 
  def prepare_save
    self.email = email.downcase
    self.user_id = user_id.downcase
  end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def categories
    Category.where("user_id = ?", id)
  end

end
