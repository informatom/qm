class RolesInCompanyController < ApplicationController
  # GET /role_in_companies
  # GET /role_in_companies.json
  def index
    @role_in_companies = RoleInCompany.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @role_in_companies }
    end
  end

  # GET /role_in_companies/1
  # GET /role_in_companies/1.json
  def show
    @role_in_company = RoleInCompany.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @role_in_company }
    end
  end

  # GET /role_in_companies/new
  # GET /role_in_companies/new.json
  def new
    @role_in_company = RoleInCompany.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @role_in_company }
    end
  end

  # GET /role_in_companies/1/edit
  def edit
    @role_in_company = RoleInCompany.find(params[:id])
  end

  # POST /role_in_companies
  # POST /role_in_companies.json
  def create
    @role_in_company = RoleInCompany.new(params[:role_in_company])

    respond_to do |format|
      if @role_in_company.save
        format.html { redirect_to @role_in_company, notice: 'Role in company was successfully created.' }
        format.json { render json: @role_in_company, status: :created, location: @role_in_company }
      else
        format.html { render action: "new" }
        format.json { render json: @role_in_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /role_in_companies/1
  # PUT /role_in_companies/1.json
  def update
    @role_in_company = RoleInCompany.find(params[:id])

    respond_to do |format|
      if @role_in_company.update_attributes(params[:role_in_company])
        format.html { redirect_to @role_in_company, notice: 'Role in company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @role_in_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /role_in_companies/1
  # DELETE /role_in_companies/1.json
  def destroy
    @role_in_company = RoleInCompany.find(params[:id])
    @role_in_company.destroy

    respond_to do |format|
      format.html { redirect_to role_in_companies_url }
      format.json { head :no_content }
    end
  end
end
