class CompaniesController < ApplicationController
  load_and_authorize_resource

  def create
    if @company.save
      redirect_to @company, notice: t('notice.company.created')
    else
      render action: "new"
    end
  end

  def update
    if @company.update_attributes(params[:company])
      redirect_to @company, notice: t('notice.company.updated')
    else
      render action: "edit"
    end
  end

  def destroy
    begin
      @company.destroy
      flash[:success] = t('notice.company.destroyed')
    rescue ActiveRecord::DeleteRestrictionError => e
      @company.errors.add(:base, e)
      flash[:error] = t('exception.' + "#{e}")
    ensure
      redirect_to companies_url
    end
  end

  def organigram
    if params["coords"]
      x = params["coords"]["x"].to_i
      y = params["coords"]["y"].to_i
      puts x,y # print coordinates on console
      case params["object"]
      when "dep"
        @department = Department.find_by_id(params["coords"]["id"])
        @department.update_attributes(x: x ,y: y)
      when "fun"
        @function = Function.find_by_id(params["coords"]["id"])
        @function.update_attributes(x: x ,y: y)
      end
    end

    respond_to do |format|
      format.html # diagram.html.erb
      format.js
    end
  end
end