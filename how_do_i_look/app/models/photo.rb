class Photo < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :likes


  def rating
    total_likes = likes.count
    like_num = likes.where(:kind => 'like').count

      
    if total_likes > 0

      percentage = (like_num/total_likes.to_r).to_f 

      if percentage > 0.5
        @rating = "approval"
      elsif percentage < 0.5
        @rating = "disapproval"
      else
        @rating = "neutral"
      end

    end

    @rating
  end

  def score
    total_likes = likes.count
    like_num = likes.where(:kind => 'like').count

    if total_likes > 0
      percentage = (like_num/total_likes.to_r).to_f 

      if percentage > 0.5
        @score = (percentage * 100).to_int
      elsif percentage < 0.5
        @score = ((1 - percentage) * 100).to_int
      else
        @score = 50
      end
    elsif total_likes == 0
        @score = 0
    end

    @score
  end

end
