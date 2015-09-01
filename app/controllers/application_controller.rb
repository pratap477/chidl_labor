class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_locale
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  private

  def set_locale
    I18n.locale = :mr
  end

  def after_sign_in_path_for(user)
    if !current_user.nil?
      dashboard_index_path
    end
  end
end
