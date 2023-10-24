class ApplicationController < ActionController::Base
  before_action :authenticate_admin!
  before_action :set_current_member
  helper_method :current_member

  private

  def set_current_member
    @current_member = Member.find_by(email: current_admin.email) if admin_signed_in?
  end

  def current_member
    @current_member
  end
end
