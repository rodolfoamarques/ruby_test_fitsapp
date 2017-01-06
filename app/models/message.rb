class Message < ApplicationRecord
  belongs_to :from_user, :class_name => 'User'
  belongs_to :to_user, :class_name => 'User'

  default_scope -> { order(created_at: :desc) }

  validates :message,  presence: true
  validates :to_user_id,  presence: true
  validates :from_user_id,  presence: true

end
