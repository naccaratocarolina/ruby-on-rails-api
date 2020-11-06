class AddressesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :find_owner, only: [:show, :create, :update, :destroy]
  before_action :find_owner_address, only: [:show, :update, :destroy]

  # GET /owners/:owner_id/addresses
  def show
    render json: @address
  end

  # POST /owners/:owner_id/addresses
  def create
    @address = @owner.build_address(address_params)
    if @address.save
      render json: @address
    else
      render error: { message: "Não foi possível criar esse endereco :( "}, status: 400
    end
  end

  # PUT /owners/:owner_id/addresses
  def update
    if @address
      @address.update(address_params)
      render json: { address: @address, message: "Endereco atualizado com sucesso! :)" }, status: 200
    else
      render json: { message: "Não foi possível atualizar esse endereco! :(" }, status: 400
    end
  end

  # DELETE /owners/:owner_id/addresses
  def destroy
    if @address
      @address.destroy
      render json: { message: "Endereco deletado com sucesso! :)" }, status: 200
    else
      render json: { message: "Não foi possível deletar esse endereco! :(" }, status: 400
    end
  end

  private

  # Inicializa os parametros de address
  def address_params
    params.permit(:street)
  end

  # Encontra o owner que esta fazendo o request
  def find_owner
    @owner = Owner.find(params[:owner_id])
  end

  # Encontra o address referente ao owner que esta fazendo o request
  def find_owner_address
    @address = @owner.address if @owner
  end
end
