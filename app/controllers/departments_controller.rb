class DepartmentsController < ApplicationController
  def index
    @departments = Department.all
  end

  def show
    @department = Department.find(params[:id])
  end

  def new
    @department = Department.new
  end

  def edit
    @department = Department.find(params[:id])
  end

  def create
    @department = Department.new(params[:department])

    if @department.save
      redirect_to @department, notice: 'Department was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @department = Department.find(params[:id])

    if @department.update_attributes(params[:department])
      redirect_to @department, notice: 'Department was successfully updated.'
    else
      ender action: "edit"
    end
  end

  def destroy
    begin
      @department = Department.find(params[:id])
      @department.destroy
      flash[:success] = "department successfully destroyed."
    rescue ActiveRecord::DeleteRestrictionError => e
      @department.errors.add(:base, e)
      flash[:error] = "#{e}"
    ensure
      redirect_to departments_url
    end
  end
end
