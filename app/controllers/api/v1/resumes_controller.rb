class Api::V1::ResumesController < ApplicationController
  before_action :set_resume, only: [:show, :update, :destroy]

  # GET /resumes
  def index
    render json: Resume.all
  end

  # GET /resumes/1
  def show
    render json: Resume.find(params[:id])
  end

  # POST /resumes
  def create
    @resume = Resume.new(resume_params)

    if @resume.save
      render json: @resume, status: :created, location: api_v1_resume_url(@resume)
    else
      render json: @resume.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /resumes/1
  def update
    if @resume.update(resume_params)
      render json: @resume
    else
      render json: @resume.errors, status: :unprocessable_entity
    end
  end

  # DELETE /resumes/1
  def destroy
    @resume.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resume
      @resume = Resume.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def resume_params
      params.require(:resume).permit(:job_title, :photo, :first_name, :last_name, :email, :phone, :country, :city, :address, :postal_code, :driving_license, :nationality, :place_of_birth, :date_of_birth, :professional_summary)
    end
end
