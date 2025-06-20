class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about, :index]
  
  private

  def admin_controller?
    self.class.module_parent_name == 'Admin'
  end

end
