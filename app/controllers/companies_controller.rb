class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end

  def edit
    @company = Company.find(params[:id])
  end

  def create
    @company = Company.new(params[:company])

    if @company.save
      redirect_to @company, notice: 'Company was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @company = Company.find(params[:id])

    if @company.update_attributes(params[:company])
      redirect_to @company, notice: 'Company was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    begin
      @company = Company.find(params[:id])
      @company.destroy
      flash[:success] = "company successfully destroyed."
    rescue ActiveRecord::DeleteRestrictionError => e
      @company.errors.add(:base, e)
      flash[:error] = "#{e}"
    ensure
      redirect_to companies_url
    end
  end
end
