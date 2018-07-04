# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protected

  def after_sign_in_path_for(_resource)
    if current_user.admin?
      root_path
    else
      search_path
    end
  end
end
