class EmploymentsController < ApplicationController
  load_and_authorize_resource

  def create
    if @employment.save
      redirect_to @employment, notice: 'Employment was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if @employment.update_attributes(params[:employment])
      redirect_to @employment, notice: 'Employment was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /employments/1
  # DELETE /employments/1.json
  def destroy
    @employment.destroy

    redirect_to employments_url
  end
end
