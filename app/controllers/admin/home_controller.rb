class Admin::HomeController < Admin::ApplicationController
   before_action :if_not_admin
   
   def index
   end

   private
   def if_not_admin
     redirect_to root_path unless current_admin.admin_flg?
   end

end
