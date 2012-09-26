class DepartmentAffiliationsController < ApplicationController
  # GET /department_affiliations
  # GET /department_affiliations.json
  def index
    @department_affiliations = DepartmentAffiliation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @department_affiliations }
    end
  end

  # GET /department_affiliations/1
  # GET /department_affiliations/1.json
  def show
    @department_affiliation = DepartmentAffiliation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @department_affiliation }
    end
  end

  # GET /department_affiliations/new
  # GET /department_affiliations/new.json
  def new
    @department_affiliation = DepartmentAffiliation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @department_affiliation }
    end
  end

  # GET /department_affiliations/1/edit
  def edit
    @department_affiliation = DepartmentAffiliation.find(params[:id])
  end

  # POST /department_affiliations
  # POST /department_affiliations.json
  def create
    @department_affiliation = DepartmentAffiliation.new(params[:department_affiliation])

    respond_to do |format|
      if @department_affiliation.save
        format.html { redirect_to @department_affiliation, notice: 'Department affiliation was successfully created.' }
        format.json { render json: @department_affiliation, status: :created, location: @department_affiliation }
      else
        format.html { render action: "new" }
        format.json { render json: @department_affiliation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /department_affiliations/1
  # PUT /department_affiliations/1.json
  def update
    @department_affiliation = DepartmentAffiliation.find(params[:id])

    respond_to do |format|
      if @department_affiliation.update_attributes(params[:department_affiliation])
        format.html { redirect_to @department_affiliation, notice: 'Department affiliation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @department_affiliation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /department_affiliations/1
  # DELETE /department_affiliations/1.json
  def destroy
    @department_affiliation = DepartmentAffiliation.find(params[:id])
    @department_affiliation.destroy

    respond_to do |format|
      format.html { redirect_to department_affiliations_url }
      format.json { head :no_content }
    end
  end
end
