class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes
  
  before_action :set_current_user
  # Đặt người dùng hiện tại dựa trên session
  def set_current_user
    if session[:user_id]
      @current_user = Nguoidung.find_by(
        IDNGUOIDUNG: session[:user_id]
      )
    end
  end

  def current_user
    @current_user
  end

  helper_method :current_user
end
