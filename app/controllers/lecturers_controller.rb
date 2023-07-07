class LecturersController < ApplicationController
  before_action :set_lecturer, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :new]
  before_action :ensure_admin!, only: [:edit, :update, :destroy, :new]

  def ensure_admin!
    unless current_user.is_admin?
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(root_path) and return
    end
  end
  # GET /lecturers or /lecturers.json
  def index
    @lecturers = Lecturer.all
  end

  # GET /lecturers/1 or /lecturers/1.json
  def show
  end

  # GET /lecturers/new
  def new
    @lecturer = Lecturer.new
  end

  # GET /lecturers/1/edit
  def edit
  end

  # POST /lecturers or /lecturers.json
  def create
    @lecturer = Lecturer.new(lecturer_params)

    respond_to do |format|
      if @lecturer.save
        format.html { redirect_to lecturer_url(@lecturer), notice: "Lecturer was successfully created." }
        format.json { render :show, status: :created, location: @lecturer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lecturer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lecturers/1 or /lecturers/1.json
  def update
    respond_to do |format|
      if @lecturer.update(lecturer_params)
        format.html { redirect_to lecturer_url(@lecturer), notice: "Lecturer was successfully updated." }
        format.json { render :show, status: :ok, location: @lecturer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lecturer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lecturers/1 or /lecturers/1.json
  def destroy
    @lecturer.destroy

    respond_to do |format|
      format.html { redirect_to lecturers_url, notice: "Lecturer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lecturer
      @lecturer = Lecturer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lecturer_params
      params.require(:lecturer).permit(:first_name, :last_name, :user_id)
    end
end
