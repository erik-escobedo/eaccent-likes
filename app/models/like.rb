class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def self.total_points
    all.map(&:points).sum
  end

  def points
    if positive?
      Setting.points_per_upvote
    else
      Setting.points_per_downvote
    end
  end
end
