class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  #http_basic_authenticate_with name: "lorena", password: "avrilsc90", only: [:edit, :update, :destroy]

  before_action do
   resource = controller_name.singularize.to_sym
   method = "#{resource}_params"
   params[resource] &&= send(method) if respond_to?(method, true)
  end

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.order(:description).page(params[:page]).per(5)
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
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
    @team_created = @team.description

    if @team.save
      redirect_to team_path(@team), notice: "Equipe [#{@team_created}] criada com sucesso!"
    else
      render :new
    end
  end


  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update

    if @team.update(team_params)
      redirect_to team_path(@team), notice: "Equipe [#{@team.description}] atualizada com sucesso!"
    else
      render :edit
    end
  end


  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team_deleted = @team.description

    if @team.destroy
     redirect_to teams_path, notice: "Equipe [#{@team_deleted}] deletada com sucesso!"
   else
     redirect_to teams_path, notice: "Erro ao deletar a equipe [#{@team_deleted}]..."
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id]) #nao precisa colocar essa linha dentro do update, destroy, edit, show
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:id, :description)
    end
end
