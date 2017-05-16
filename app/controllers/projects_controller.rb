class ProjectsController < ApplicationController
  
  # Erro da gem Cancan (ActiveModel::ForbiddenAttributesError)
  before_action do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  def index
    @projects = Project.all.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @project = Project.find(params[:id])
  end

   def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @sprints = Sprint.where(id: params[:sprint_ids])
    @project_created = @project.description

    @sprints.each do |sprint|
      # @project.sprints.push(sprint)
      @project.sprints << sprint
    end

    if @project.save
      redirect_to project_path(@project), notice: "Projeto [#{@project_created}] criado com sucesso!"
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @sprints = Sprint.where(id: params[:sprint_ids]).ids

    @project.project_sprints.each do |project_sprint|
      @id = @sprints.sample

      if @id.blank?
        project_sprint.destroy
      else
        project_sprint.update_attribute('sprint_id', @id)
      end
      @sprints.delete(@id)
    end

    unless @sprints.blank?
      @sprints.each do |sprint|
        ProjectSprint.create!(
          project_id: @project.id,
          sprint_id: sprint
          )
      end
    end

    if @project.update(project_params)
      redirect_to project_path(@project), notice: "Projeto [#{@project.description}] atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project_deleted = @project.description

    if @project.destroy
      redirect_to projects_path, notice: "Projeto [#{@project_deleted}]deletado com sucesso!"
    else
      redirect_to projects_path, notice: "Erro ao deletar o Projeto [#{@project_deleted}]..."
    end
  end

  private

  def project_params
    params.require(:project).permit(:id, :description, :team_id)
  end

end
