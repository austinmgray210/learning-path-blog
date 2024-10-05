class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
	include Pagy::Backend
	rescue_from Pagy::OverflowError, with: :redirect_to_last_page
	
	def redirect_to_last_page(exception)
		redirect_to url_for(page: exception.pagy.last), notice: "Page ##{params[:page]} is overflowing. Showing page #{exception.pagy.last} instead."
	end
end
