class SprintsController < ApplicationController
  
  def index
    @sprints = Sprint.all.order(created_at: :desc).page(params[:page]).per(10) #lista toadas as Sprints em ordem da mais nova p/ mais velha
  end

  def show
    @sprint = Sprint.find(params[:id]) #pega a variavel Sprint e o id especifico para mostrar os dados dela
  end

  def new
    @sprint = Sprint.new
  end

  def edit
    @sprint = Sprint.find(params[:id]) #pega a variavel Sprint e o id especifico para editar os dados dela
  end


  def create
    @sprint = Sprint.new(sprint_params)
    @sprint_created = @sprint.description

    if @sprint.save
      redirect_to sprint_path(@sprint), notice: "[#{@sprint_created}] criada com sucesso!"
    else
      render :new
    end
  end

  def update
    @sprint = Sprint.find(params[:id])
    if @sprint.update(sprint_params)
      redirect_to sprint_path(@sprint), notice: "[#{@sprint.description}] atualizada com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    @sprint = Sprint.find(params[:id])
    @sprint_deleted = @sprint.description

    if @sprint.destroy
      redirect_to sprints_path, notice: "[#{@sprint_deleted}] deletada com sucesso!"
    else
      redirect_to sprints_path, notice: "Erro ao deletar o Sprint [#{@sprint_deleted}]..."
    end
  end

  private

  def sprint_params # Coloca os parametros que vao ser utilizados. Evita parametros indesejados
    params.require(:sprint).permit(:id, :description, :inicio, :fim,
                                  :pontos_cadastrados, :pontos_atualizados)
  end

end
