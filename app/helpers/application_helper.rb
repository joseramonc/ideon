module ApplicationHelper
  def active_path(current_controller, current_action=nil)
    if current_controller.to_s == params[:controller]
      'active'
    end
  end
end
