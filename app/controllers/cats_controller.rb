class CatsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :find_owner, only: [:list, :show, :create, :update, :destroy]
  before_action :find_owner_cat, only: [:list, :show, :update, :destroy]

  # Lista todos os gatinhos registrados no banco de dados
  # GET /cats
  def index
    @cats = Cat.all
    render json: @cats
  end

  # Lista todos os gatinhos de determinado owner
  # GET /owners/:owner_id/cats
  def list
    render json: @owner.cats
  end

  # GET /owners/:owner_id/cats/:id
  def show
    render json: @cat
  end

  # POST /owners/:owner_id/cats
  def create
    @cat = @owner.cats.create!(cat_params)
    if @cat.save
      render json: @cat
    else
      render error: { message: "Não foi possível criar esse gatinho :( "}, status: 400
    end
  end

  # PUT /owners/:owner_id/cats/:id
  def update
    if @cat
      @cat.update(cat_params)
      render json: { cat: @cat, message: "Gatinho atualizado com sucesso! :)" }, status: 200
    else
      render json: { message: "Não foi possível editar esse gatinho!" }, status: 400
    end
  end

  # DEL /owners/:owner_id/cats/:id
  def destroy
    if @cat
      @cat.destroy
      render json: { message: "Gatinho deletado com sucesso!" }, status: 200
    else
      render json: { message: "Não foi possível deletar esse gatinho!" }
    end
  end

  private

  # Inicializa os parametros para criar um gatinho
  def cat_params
    params.permit(:name, :motto)
  end

  # Encontra o owner que esta fazendo o request
  def find_owner
    @owner = Owner.find(params[:owner_id])
  end

  # Encontra o gatinho correspondente ao dono que esta fazendo o request
  def find_owner_cat
    @cat = @owner.cats.find_by!(id: params[:id]) if @owner
  end
end