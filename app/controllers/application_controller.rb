class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def set_locale
  	  		I18n.locale = :es
  end

	def current_ability
	   @current_ability ||= Ability.new(current_admin_user)
	end

end
