module AdminHelper
  def admin?
    current_user.admin == 1
  end
end
