class CollegeClassesController < ApplicationController
  before_action :set_college_class, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  def ensure_admin!
    unless current_user.is_admin?
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(root_path) and return
    end
  end

  # GET /college_classes or /college_classes.json
  def index
    @college_classes = CollegeClass.all
  end

  # GET /college_classes/1 or /college_classes/1.json
  def show
  end

  # GET /college_classes/new
  def new
    @college_class = CollegeClass.new
    unless current_user.is_admin
      @college_class.lecturer = Lecturer.find_by(user_id: current_user.id)
    end
  end

  # GET /college_classes/1/edit
  def edit
  end

  # POST /college_classes or /college_classes.json
  def create
    @college_class = CollegeClass.new(college_class_params)
    unless current_user.is_admin
      @college_class.lecturer = Lecturer.find_by(user_id: current_user.id)
    end

    respond_to do |format|
      if @college_class.save
        format.html { redirect_to college_class_url(@college_class), notice: "College class was successfully created." }
        format.json { render :show, status: :created, location: @college_class }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @college_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /college_classes/1 or /college_classes/1.json
  def update
    respond_to do |format|
      if @college_class.update(college_class_params)
        format.html { redirect_to college_class_url(@college_class), notice: "College class was successfully updated." }
        format.json { render :show, status: :ok, location: @college_class }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @college_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /college_classes/1 or /college_classes/1.json
  def destroy
    @college_class.destroy

    respond_to do |format|
      format.html { redirect_to college_classes_url, notice: "College class was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_college_class
      @college_class = CollegeClass.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def college_class_params
      params.require(:college_class).permit(:day, :start_time, :end_time, :lecturer_id, :course_id, :room_id)
    end
end
