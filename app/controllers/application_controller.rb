class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image])
  end

  def editor_user?
    if user_signed_in?
      editor_ids = []
      @trip.users.each do |user|
        editor_ids << user.id
      end
      editor_ids.include?(current_user.id)
    end
  end
end
