module ApplicationHelper
  def error_class(error_type)
    case error_type
    when 'notice' then 'info'
    when 'success' then 'success'
    when 'error' then 'danger'
    when 'alert' then 'danger'
    end
  end

  def active_path(current_controller, current_action=nil)
    if current_controller.to_s == params[:controller]
      'active'
    end
  end
end
