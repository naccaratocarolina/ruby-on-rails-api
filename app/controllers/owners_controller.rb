class OwnersController < ApplicationController
  before_action :find_owner, only: [:show, :update, :destroy, :address, :cats]

  # GET /owners
  def index
    @owners = Owner.all
    render json: @owners
  end

  # GET /owners/:id
  def show
    render json: @owner
  end

  # POST /owners
  def create
    @owner = Owner.new(owner_params)
    if @owner.save
      render json: @owner
    else
      render error: { message: "Não foi possível criar esse dono :( "}, status: 400
    end
  end

  # PUT /owners/:id
  def update
    if @owner
      @owner.update(owner_params)
      render json: { owner: @owner, message: "Dono atualizado com sucesso! :)" }, status: 200
    else
      render json: { message: "Não foi possível editar esse dono!" }, status: 400
    end
  end

  # DELETE /owners/:id
  def destroy
    if @owner
      @owner.destroy
      render json: { message: "Dono deletado com sucesso!" }, status: 200
    else
      render json: { message: "Não foi possível deletar esse dono!" }
    end
  end

  private

  # Funcao que inicializa os parametros necessarios para criar um owner
  def owner_params
    params.permit(:name)
  end

  # Funcao auxiliar que encontra o owner que esta fazendo o request, atraves do seu id
  def find_owner
    @owner = Owner.find(params[:id])
  end
end