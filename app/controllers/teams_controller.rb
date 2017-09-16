class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
<<<<<<< HEAD

  # Erro da gem Cancan (ActiveModel::ForbiddenAttributesError)
=======
  #http_basic_authenticate_with name: "lorena", password: "avrilsc90", only: [:edit, :update, :destroy]
  before_action :authenticate_user!


>>>>>>> d0c6183c3349cba16c54d8ce4c0fb5ee26c49700
  before_action do
   resource = controller_name.singularize.to_sym
   method = "#{resource}_params"
   params[resource] &&= send(method) if respond_to?(method, true)
  end

  load_and_authorize_resource

<<<<<<< HEAD
  # GET /teams
  # GET /teams.json
  def index
    if current_user_total?
      @teams = Team.order(:description).page(params[:page]).per(5)
    else
      ids = []
      tus = TeamUser.where(user_id: current_user.id)
      tus.each do |tu| # user_id | team_id
        ids << tu.team_id # [1, 6, 7]
      end

      return @teams = Team.where(id: ids).order(:description).page(params[:page]).per(5)
    end
=======

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.order(:description).page(params[:page]).per(5)
>>>>>>> d0c6183c3349cba16c54d8ce4c0fb5ee26c49700
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
<<<<<<< HEAD
=======
    @team = Team.find(params[:id])
>>>>>>> d0c6183c3349cba16c54d8ce4c0fb5ee26c49700
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)

<<<<<<< HEAD
    if @team.save
      redirect_to team_path(@team), notice: I18n.t('messages.created')
    else
      render :new
=======
    respond_to do |format|
      if @team.save
        format.html { redirect_to team_path(@team), notice: I18n.t('messages.created') }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
>>>>>>> d0c6183c3349cba16c54d8ce4c0fb5ee26c49700
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
<<<<<<< HEAD
    if @team.update(team_params)
      redirect_to team_path, notice: I18n.t('messages.updated')
    else
      render :edit
=======
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to team_path, notice: I18n.t('messages.updated') }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
>>>>>>> d0c6183c3349cba16c54d8ce4c0fb5ee26c49700
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
<<<<<<< HEAD

    if @team.destroy
      redirect_to teams_path, notice: I18n.t('messages.destroyed')
    else
      redirect_to teams_path, notice: "Erro ao excluir..."
=======
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_path, notice: I18n.t('messages.destroyed') }
      format.json { head :no_content }
>>>>>>> d0c6183c3349cba16c54d8ce4c0fb5ee26c49700
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:id, :description)
    end
end
