class User < ApplicationRecord

  has_many :sent_messages, :class_name => 'Message', :foreign_key => 'from_user_id'
  has_many :received_messages, :class_name => 'Message', :foreign_key => 'to_user_id'

  before_save { self.email = email.downcase }

  VALID_USERTYPE_REGEX = /\A(user|trainer)\z/i
  validates :user_type,  presence: true, length: { maximum: 10 }, format: { with: VALID_USERTYPE_REGEX }

  validates :name,  presence: true, length: { maximum: 100 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 256 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }, allow_nil: true

  def User.digest( string )
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create( string, cost: cost )
  end

end
