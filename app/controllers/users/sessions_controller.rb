# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    def create
      self.resource = warden.authenticate!(auth_options)
      set_flash_message!(:notice, :signed_in)
      set_first_login_flash
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)
    end

    private

    def set_first_login_flash
      flash[:notice] = "Hi, #{current_user.first_name}" if current_user.sign_in_count == 1
    end
  end
end
