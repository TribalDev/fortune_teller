class Vote < ActiveRecord::Base
  belongs_to :user

  belongs_to :voteable, polymorphic: true
  validates :creator, uniqueness: {scope: :voteable}
end
