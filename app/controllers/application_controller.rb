class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  layout :layout_by_resource #pega o layout especifico


  # gerencia o aside_bar de forma que fique azul qnd o item é acessado,
  # faz aparecer os subitens e olha se o usuario eh o adm
  include ApplicationHelper



    private

    def layout_by_resource
      if devise_controller?
        "devise" #pagina de login
      else
        "application" #restante das paginas
      end
    end

end
