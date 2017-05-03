class Api::V1::CompaniesController < ApplicationController
  before_action :set_company, only: %i[show update destroy]

  def index
    @companies = Company.all
    render json: { companies: @companies},  except: [ :created_at, :updated_at ]
  end

  def show
    render json: @company

  end

  def create
    @company = Company.new(company_params)
    if @company.save
        render json: { company: @company }
    else
        render json: { errors: @company.errors, status: :unprocessable_entity }
    end
  end

  def update
    if @company.update(company_params)
      render json: { status: :updated }
    else
      render json: { errors: @company.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    if @company.destroy
      render json: { status: :deleted }
    else
      render json: { errors: @company.errors, status: :unprocessable_entity }
    end
  end

  private
  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.permit(:name, :location)
  end

end