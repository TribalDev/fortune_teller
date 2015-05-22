class Message < ActiveRecord::Base
  belongs_to :user
  has_many :votes, as: :voteable

  validates :author, presence: true
  validates :advice, presence: true

  def up_vote
    self.votes.where(vote: true).length
  end

  def down_vote
    self.votes.where(vote: false).length
  end

  def vote_count
    self.up_vote - self.down_vote
  end
end
