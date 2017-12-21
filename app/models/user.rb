class User < ApplicationRecord
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

end
