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
      @activities = Activity.all.order(created_at: :desc).page(params[:page]).per(10)
    else
      team_ids = []
      TeamUser.where(user_id: current_user.id).each do |tu|
        team_ids << tu.team_id
      end

      # @sprints = Sprint.joins(:projects).where(projects: {team_id: team_ids})
      #            .page(params[:page]).per(10)

      @projects = Project.where(team_id: team_ids).page(params[:page]).per(5)
    end
  end

  def show
    unless current_user_total?
      if params[:sprint].present? && params[:project].present?
        @project = Project.find(params[:project])
        @sprint =  Sprint.find(params[:sprint])
      end
    end
  end

  def new
    @activity = Activity.new
    unless current_user_total?
      @project = Project.find(params[:project]).id
      @sprint =  Sprint.find(params[:sprint]).id
    end
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
                                     :status_id, :label_id, :sprint_id)
  end


end
