class Post < ActiveRecord::Base
  belongs_to :user
  has_many :likes

  def self.with_total_points
    Post.find_by_sql("""
      SELECT posts.*, IFNULL(points_per_post.points, 0) as total_points
        FROM posts LEFT JOIN (
          SELECT post_id, SUM(points) as points
            FROM (
              SELECT post_id,
                case when positive = 't'
                  then #{Setting.points_per_upvote}
                  else #{Setting.points_per_downvote}
                end as points
              FROM LIKES AS l
            ) GROUP BY post_id
        ) as points_per_post
        ON posts.id = points_per_post.post_id
      ORDER BY total_points DESC;
    """)
  end

  def total_points
    # If it's not loaded from SQL, retrieve it from relationship
    attributes['total_points'] || likes.total_points
  end
end
