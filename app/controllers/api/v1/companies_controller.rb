class Api::V1::CompaniesController < ApplicationController
  before_action :set_company, only: %i[show update mark_destroy]

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

  def mark_destroy
    #метод не удаляет компанию на совсем, а отмечает ее как удаленную
    if @company.deleted
      render json: { deleted_company: [], deleted_already: :not_modified}
    else
      @company.delete_company
      render json: { deleted_company: @company,
                     code: 200,
                     status: :success },
             except: [ :created_at, :updated_at ]
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