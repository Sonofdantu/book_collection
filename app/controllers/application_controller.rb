class ApplicationController < ActionController::Base
  before_action :authenticate_admin!
  before_action :set_current_member
  helper_method :current_member

  private

  def set_current_member
    @current_member = Member.find_by(email: current_admin.email) if admin_signed_in?
  end

  def check_permissions
    @current_member = Member.find_by(email: current_admin.email) if admin_signed_in?

    if admin_signed_in?
      if (@current_member.position == "Member") then
        handle_member
      elsif (@current_member.position == "Pending") then
        handle_pending
      end
    end
  end

  def handle_member
    illegal_paths = ["edit", "new", "officer", "finances"]

    for path in illegal_paths
      if request.path.to_s.include?(path)
        redirect_to(root_path)
      end
    end
  end

  def handle_pending
    if request.path != root_path
      redirect_to(root_path)
    end
  end


  def current_member
    @current_member
  end
end


