  class Admin::ApplicationController < ApplicationController
    before_action :login_required
    layout 'admins/application'
    private

    def login_required
      redirect_to new_admin_session_path unless current_admin
    end
  end
