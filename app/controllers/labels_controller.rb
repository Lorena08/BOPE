class LabelsController < ApplicationController

  before_action :set_label, only: [:show, :edit, :update, :destroy]
  # Erro da gem Cancan (ActiveModel::ForbiddenAttributesError)
  before_action do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end
  load_and_authorize_resource

  def index
    @labels = Label.all.order(created_at: :desc).page(params[:page]).per(10)
  end

  def new
    @label = Label.new
  end

  def create
    @label = Label.new(label_params)
    if @label.save
      redirect_to label_path(@label), notice: "Rótulo criado com sucesso!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @label.update(label_params)
      redirect_to label_path(@label), notice: "Rótulo atualizado com sucesso!"
    else
      render :new
    end
  end

  def destroy
    if @label.destroy
      redirect_to labels_path, notice: "Rótulo excluído com sucesso!"
    end
  end

  private

  def set_label
    @label = Label.find(params[:id])
  end

  def label_params
    params.require(:label).permit(:id, :description, :color_id)
  end

end
