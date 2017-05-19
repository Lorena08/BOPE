class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  # Erro da gem Cancan (ActiveModel::ForbiddenAttributesError)
  before_action do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end
  load_and_authorize_resource

  def index
    if current_user_total?
      @activities = Activity.all.order(:description).page(params[:page]).per(10)
    else
      team_ids = [] # array de ids dos times
      TeamUser.where(user_id: current_user.id).each do |tu| # pega cada relação de usuario c equipe onde o usuario tem o id do usuario atual
        team_ids << tu.team_id # pega cada relacao acima e coloca no array
      end

      # tem que relacionar o projeto com a atividade e nao Sprint com atividade
      project_ids = Project.where(team_id: team_ids).ids # pega os ids dos projetos onde tem os ids dos times colocados noarray

      return @activities = Activity.where(project_id: project_ids)
                           .order(:description).page(params[:page]).per(10) # retorna as atividades onde tem os projetos listados acima e coloca em ordem
    end
  end

  def show

  end

  def new
    @activity = Activity.new # a variavel @activity recebe uma nova atividade
    @project = Project.find(params[:project]) # a variavel @project recebe o projeto
    @sprint =  Sprint.find(params[:sprint]) # a variavel @sprint recebe a sprint
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
        redirect_to activity_path(@activity), notice: "Atividade criada com sucesso!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @activity.update(activity_params)
      redirect_to activity_path(@activity), notice: "Atividade atualizada com sucesso!"
    else
      render :new
    end
  end

  def destroy
    if @activity.destroy
      redirect_to activities_path, notice: "Atividade excluída com sucesso!"
    end
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:id, :description, :pontos_cadastrados,
                                     :status_id, :label_id, :project_id,
                                     :sprint_id)
  end


end
