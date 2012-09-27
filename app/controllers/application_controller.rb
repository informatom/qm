class ApplicationController < ActionController::Base
  protect_from_forgery

#  rescue_from CanCan::AccessDenied do |exception|
#    redirect_to root_url, :alert => exception.message, :locale => I18n.locale
#  end

  # HAS: 20120416: Ausnahmen werden in den einzelnen Controllern spezifiziert
  before_filter :authenticate_user!

  before_filter :set_locale
  before_filter :set_menu

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def set_menu
    session[:menu] = params[:menu] || session[:menu] || "admin"
  end

  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :locale => I18n.locale }
  end
end
