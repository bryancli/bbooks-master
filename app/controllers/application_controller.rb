class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters
	  devise_parameter_sanitizer.for(:sign_up) << :username
	  devise_parameter_sanitizer.for(:sign_up) << :avatar_url

	  devise_parameter_sanitizer.for(:account_update) << :avatar_url
	end

	protected

  	# def authenticate_user!
   #      if user_signed_in?
   #   		super
   #  	else
	  #     	redirect_to "/users/sign_up"
	  #     	## if you want render 404 page
	  #     	## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
   #  	end
  	# end

end
