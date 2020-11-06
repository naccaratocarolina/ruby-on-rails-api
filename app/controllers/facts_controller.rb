require 'uri'
require 'net/http'

class FactsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :find_cat, only: [:index, :show, :create, :update, :destroy]
  before_action :find_cat_fact, only: [:show, :update, :destroy]

  # GET /owners/:owner_id/cats/:cat_id/facts
  def index
    render json: @cat.facts
  end

  # GET /owners/:owner_id/cats/:cat_id/facts/:id
  def show
    render json: @fact
  end

  # POST /owners/:owner_id/cats/:cat_id/facts
  # Para criar um fato, nao eh necessario passar nada como parametro
  # Pois o atributo fact esta sendo preenchido internamente atraves da api de cat facts
  def create
    @fact = @cat.facts.create!({ fact: api_request })
    if @fact.save
      render json: @fact
    else
      render error: { message: "Não foi possível criar esse fato para este gatinho! :(" }, status: 400
    end
  end

  # PUT /owners/:owner_id/cats/:cat_id/facts/:id
  def update
    if @fact
      @fact.update(fact_params)
      render json: { fact: @fact, message: "Fato atualizado com sucesso! :)" }, status: 200
    else
      render json: { message: "Não foi possível atualizar esse fato deste gatinho! :(" }, status: 400
    end
  end

  # DELETE /owners/:owner_id/cats/:cat_id/facts/:id
  def destroy
    if @fact
      @fact.destroy
      render json: { message: "Fato deletado com sucesso! :)" }
    else
      render json: { message: "Nao foi possível deletar esse fato deste gatinho! :(" }
    end
  end

  private

  # Inicializando os parametros de fact
  def fact_params
    params.permit(:fact)
  end

  # Encontra o gatinho que esta fazendo o request
  def find_cat
    @cat = Cat.find(params[:cat_id])
  end

  # Encontra o fact correspondente ao gatinho do request, usando a sua relacao cat->facts
  def find_cat_fact
    @fact = @cat.facts.find_by!(id: params[:id]) if @cat
  end

  # Funcao que pega um fact de um endpoint que gera fatos aleatorios sobre gatos
  def api_request
    url = URI.parse("https://catfact.ninja/fact")
    response = Net::HTTP.get_response(url)
    JSON.parse(response.body)["fact"]
  end
end
