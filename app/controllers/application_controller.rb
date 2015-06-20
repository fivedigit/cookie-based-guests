class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    super || guest_user
  end

  def user_signed_in?
    current_user.registered?
  end

  private

  def guest_user
    # Can also be replaced with session!
    @guest ||= Guest.new(cookies.signed)
  end
end
