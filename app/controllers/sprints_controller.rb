class SprintsController < ApplicationController

  before_action do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end
  load_and_authorize_resource

  #index atualizado
  def index
    if current_user_total?
      # lista toadas as Sprints em ordem da mais nova p/ mais velha
      @sprints = Sprint.all.order(:fim).page(params[:page]).per(10)
    else
      team_ids = []
      TeamUser.where(user_id: current_user.id).each do |tu|
        team_ids << tu.team_id
      end

      @projects = Project.where(team_id: team_ids).page(params[:page]).per(5)

    end
  end

  #show atualizado
  def show
    @sprint = Sprint.find(params[:id]) #pega a variavel Sprint e o id especifico para mostrar os dados dela
    @project = Project.find(params[:project])
  end

  def new
    @sprint = Sprint.new
    @project = Project.find(params[:project])
  end

  def edit
    @sprint = Sprint.find(params[:id]) #pega a variavel Sprint e o id especifico para editar os dados dela
    @project = Project.find(params[:project])
  end


  def create
    @sprint = Sprint.new(sprint_params)
    @sprint_created = @sprint.description

    if @sprint.save
      @project_sprint = ProjectSprint.new
      @project_sprint.project_id = params[:project_id]
      @project_sprint.sprint_id = @sprint.id

      if @project_sprint.save
        redirect_to sprint_path(@sprint, project: params[:project_id]), notice: "[#{@sprint_created}] criada com sucesso!"
      end

    else
      render :new
    end
  end

  def update
    @sprint = Sprint.find(params[:id])
    if @sprint.update(sprint_params)
      redirect_to sprint_path(@sprint, project: params[:project]), notice: "[#{@sprint.description}] atualizada com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    @sprint = Sprint.find(params[:id])
    @sprint_deleted = @sprint.description

    if @sprint.destroy
      redirect_to project_path(params[:project]), notice: "[#{@sprint_created}] deletada com sucesso!"
    else
      redirect_to project_path(params[:project]), notice: "Erro ao deletar o Sprint [#{@sprint_deleted}]..."
    end
  end

  private

  def sprint_params # Coloca os parametros que vao ser utilizados. Evita parametros indesejados
    params.require(:sprint).permit(:id, :description, :inicio, :fim,
                                  :pontos_cadastrados, :pontos_atualizados)
  end


end
