class DepartmentsController < ApplicationController
  before_action :set_department, only: %i[ show edit update destroy ]
  # before_action :authenticate_user!, except: [:index, :show :create]
  
 
   def generate_pdf
    pdf = Prawn::Document.new
    pdf.text "Hello, this is a PDF document generated by Prawn!"
    pdf.render_file("example.pdf")
    pdf.render_file(pdf_file)

    send_file(pdf_file, filename: "example.pdf", type: "application/pdf", disposition: "attachment")
  end

  # GET /departments or /departments.json
  def index
   
     @departments = Department.all

    # @q = Department.ransack(params[:q])
    # @departments = @q.result(distinct: true)

    if params[:search]
      @departments = Department.where("name LIKE ?", "%#{params[:search]}%")
    else
      @departments = Department.all
    end
  end

  # GET /departments/1 or /departments/1.json
  def show
  end

  # GET /departments/new
  def new
    @department = Department.new
  end

  # GET /departments/1/edit
  def edit
  end

  # POST /departments or /departments.json
  def create
    @department = Department.new(department_params)

    respond_to do |format|
      if @department.save
        format.html { redirect_to department_url(@department), notice: "Department was successfully created." }
        format.json { render :show, status: :created, location: @department }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /departments/1 or /departments/1.json
  def update
    respond_to do |format|
      if @department.update(department_params)
        format.html { redirect_to department_url(@department), notice: "Department was successfully updated." }
        format.json { render :show, status: :ok, location: @department }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departments/1 or /departments/1.json
  def destroy
    @department.destroy

    respond_to do |format|
      format.html { redirect_to departments_url, notice: "Department was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_department
      @department = Department.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def department_params
      params.require(:department).permit(:name, :user_id)
    end
end
