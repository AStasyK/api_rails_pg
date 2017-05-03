class Api::V1::AppliesController < ApplicationController
  before_action :set_apply, only: %i[show]

  def index
    @applies = Apply.all
    render json: @applies
  end

  def show
    render json: @apply
  end

  def set_apply
    @apply = Apply.find(params[:id])
  end
end