class Api::V1::JobsController < ApplicationController
  before_action :set_job, only: %i[show]

  def index
    if params[:company_id]
      @jobs = Company.find(params[:company_id]).jobs
    else
      @jobs = Job.all
    end
    render json: { jobs: @jobs},  except: [ :created_at, :updated_at ]
  end

  def show
    render json: @job
  end

  def create
    @job = Job.new(job_params)

    respond_to do |format|
      if @job.save
        format.json { render :show, status: :created, location: @job }
      else
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @job.update(jobs_params)
      render json: { status: :ok }
    else
      render json: { errors: @job.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    if @job.destroy
      render json: { status: :deleted }
    else
      render json: { errors: @job.errors, status: :unprocessable_entity }
    end
  end

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:name, :place, :company_id)
  end

end