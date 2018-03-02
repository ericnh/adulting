class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def user_is_admin?
    current_user && current_user.is_admin?
  end

  def user_is_me?
    current_user && current_user.id == 1
  end

  def authenticate_user_is_admin!
    unless user_is_admin?
      render file: 'public/401.html', status: :unauthorized
    end
  end

  def authenticate_user_is_me!
    unless user_is_me?
      render file: 'public/401.html', status: :unauthorized
    end
  end
end
