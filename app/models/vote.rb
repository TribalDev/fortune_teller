class Vote < ActiveRecord::Base
  belongs_to :creator, foreign_key: "user_id", class_name: "User"

  belongs_to :voteable, polymorphic: true

  validates :creator, uniqueness: {scope: :voteable}

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
