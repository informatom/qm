class FunctionsController < ApplicationController
  def index
    @functions = Function.all
  end

  def show
    @function = Function.find(params[:id])
  end

  def new
    @function = Function.new
  end

  def edit
    @function = Function.find(params[:id])
  end

  def create
    @function = Function.new(params[:function])

    if @function.save
      redirect_to @function, notice: t('activerecord.models.function.created')
    else
      render action: "new"
    end
  end

  def update
    @function = Function.find(params[:id])

    if @function.update_attributes(params[:function])
      redirect_to @function, notice: t('activerecord.models.function.updated')
    else
      render action: "edit"
    end
  end

  def destroy
    begin
      @function = Function.find(params[:id])
      @function.destroy
      flash[:success] = "function successfully destroyed."
    rescue ActiveRecord::DeleteRestrictionError => e
      @function.errors.add(:base, e)
      flash[:error] = "#{e}"
    ensure
      redirect_to functions_url
    end
  end
end
