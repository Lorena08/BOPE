class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  load_and_authorize_resource unless :home_controller?


  layout :layout_by_resource #pega o layout especifico

    private

    def layout_by_resource
      if devise_controller?
        "devise" #pagina de login
      else
        "application" #restante das paginas
      end
    end

    def home_controller?
      if params[:controller] == 'home'
        true
      else
        false
      end
    end

end
