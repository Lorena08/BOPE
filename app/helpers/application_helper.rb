module ApplicationHelper

  def aside_bar_active(controller)
    if params[:controller] == controller # para selecionar qual aba está e ficar azul
      "active"
    else
      ""
    end
  end
  

end
