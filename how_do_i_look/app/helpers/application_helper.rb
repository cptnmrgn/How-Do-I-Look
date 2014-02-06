module ApplicationHelper
  def is_this_user_me?(user)
    user_signed_in? && current_user.id == user.id
  end

end
