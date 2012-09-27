class DepartmentAffiliationsController < ApplicationController
  def index
    @department_affiliations = DepartmentAffiliation.all
  end

  def show
    @department_affiliation = DepartmentAffiliation.find(params[:id])
  end

  def new
    @department_affiliation = DepartmentAffiliation.new
  end

  # GET /department_affiliations/1/edit
  def edit
    @department_affiliation = DepartmentAffiliation.find(params[:id])
  end

  def create
    @department_affiliation = DepartmentAffiliation.new(params[:department_affiliation])

    if @department_affiliation.save
      redirect_to @department_affiliation, notice: 'Department affiliation was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @department_affiliation = DepartmentAffiliation.find(params[:id])

    if @department_affiliation.update_attributes(params[:department_affiliation])
      redirect_to @department_affiliation, notice: 'Department affiliation was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @department_affiliation = DepartmentAffiliation.find(params[:id])
    @department_affiliation.destroy

    redirect_to department_affiliations_url
  end
end
