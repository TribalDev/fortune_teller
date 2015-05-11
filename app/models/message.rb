class Message < ActiveRecord::Base
  validates :author, presence: true
  validates :advice, presence: true
end
