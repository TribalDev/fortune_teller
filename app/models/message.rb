class Message < ActiveRecord::Base
  belongs_to :user

  validates :author, presence: true
  validates :advice, presence: true
end
