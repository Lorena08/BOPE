module ApplicationHelper

  def aside_bar_active(controller)
    if params[:controller] == controller # para selecionar qual aba está e ficar azul
      "active"
    else
      ""
    end
  end

  def aside_bar_content_active?()
    if ['sprints', 'colors', 'labels', 'statuses', 'activities'].include? params[:controller]
      "asidebar-content-active"
    else
      "asidebar-content"
    end
  end

  def aside_bar_dropdown_active()
    if ['sprints', 'colors', 'labels', 'statuses', 'activities'].include? params[:controller]
      "active"
    else
      ""
    end
  end

  def current_user_total?
    current_user.user_profile.role == 'Total' ? true : false
  end
  
end
