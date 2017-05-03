class Api::V1::GeeksController < ApplicationController
  before_action :set_geek, only: %i[show]

  def index
    @geeks = Geek.all
    render json: @geeks
  end

  def show
    render json: @geek
  end

  def set_geek
    @geek = Geek.find(params[:id])
  end
end