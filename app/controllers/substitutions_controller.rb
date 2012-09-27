class SubstitutionsController < ApplicationController
  def index
    @substitutions = Substitution.all
  end

  def show
    @substitution = Substitution.find(params[:id])
  end

  def new
    @substitution = Substitution.new
  end

  def edit
    @substitution = Substitution.find(params[:id])
  end

  def create
    @substitution = Substitution.new(params[:substitution])

    if @substitution.save
      redirect_to @substitution, notice: 'Substitution was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @substitution = Substitution.find(params[:id])

    if @substitution.update_attributes(params[:substitution])
      redirect_to @substitution, notice: 'Substitution was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @substitution = Substitution.find(params[:id])
    @substitution.destroy

    redirect_to substitutions_url
  end
end
