class Setting < ActiveRecord::Base
  def self.points_per_upvote
    Setting.find_by(name: 'Points per Upvote').value
  end

  def self.points_per_downvote
    Setting.find_by(name: 'Points per Downvote').value
  end
end
