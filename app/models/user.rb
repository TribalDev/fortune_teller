class User < ActiveRecord::Base
  has_many :messages
  has_many :votes
  has_many :votes, as: :voteable
  has_secure_password

  validates :name, uniqueness: true

  def up_vote
    self.votes.where(vote: true).length
  end

  def down_vote
    self.votes.where(vote: false).length
  end

  def vote_count
    self.up_vote - self.down_vote
  end

  def self.vote_sort
    self.all.sort_by{|x| x.vote_count}.reverse
  end
end
