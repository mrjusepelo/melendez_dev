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





def page_not_found
    respond_to do |format|
      format.html { render template: 'errors/not_found_error', layout: 'layouts/application', status: 404 }
      format.all  { render nothing: true, status: 404 }
    end
  end

  def server_error

      puts "_______SERVER ERROR 500 CUSTOM__________________________ERROR IN"

    respond_to do |format|
      # format.html { render template: 'errors/internal_server_error', layout: 'layouts/error', status: 500 }
      format.html { render template: 'errors/internal_server_error', layout: 'layouts/error', status: 500 }
      format.all  { render nothing: true, status: 500}
    end
  end


	

end
