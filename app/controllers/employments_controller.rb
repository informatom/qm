class EmploymentsController < ApplicationController
  load_and_authorize_resource

  def index
    @employments = Employment.all
  end

  def show
    @employment = Employment.find(params[:id])
  end

  def new
    @employment = Employment.new
  end

  def edit
    @employment = Employment.find(params[:id])
  end

  def create
    @employment = Employment.new(params[:employment])

    if @employment.save
      redirect_to @employment, notice: 'Employment was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @employment = Employment.find(params[:id])

    if @employment.update_attributes(params[:employment])
      redirect_to @employment, notice: 'Employment was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /employments/1
  # DELETE /employments/1.json
  def destroy
    @employment = Employment.find(params[:id])
    @employment.destroy

    redirect_to employments_url
  end
end
