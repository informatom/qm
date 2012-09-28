class CompaniesController < ApplicationController
  load_and_authorize_resource

  def create
    if @company.save
      redirect_to @company, notice: 'Company was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if @company.update_attributes(params[:company])
      redirect_to @company, notice: 'Company was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    begin
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
