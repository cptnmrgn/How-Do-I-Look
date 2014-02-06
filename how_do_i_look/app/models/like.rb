class Like < ActiveRecord::Base
  validates :user_id, uniqueness: {scope: :photo}

  belongs_to :user 
  belongs_to :photo
end
