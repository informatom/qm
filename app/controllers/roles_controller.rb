class RolesController < ApplicationController
  load_and_authorize_resource

  def index
    @roles = Role.all
  end

  def show
    @role = Role.find(params[:id])
  end

  def new
    @role = Role.new
  end

  def edit
    @role = Role.find(params[:id])
  end

  def create
    @role = Role.new(params[:role])

    if @role.save
      redirect_to @role, notice: t('notice.role.created')
    else
      render action: "new"
    end
  end

  def update
    @role = Role.find(params[:id])

    if @role.update_attributes(params[:role])
      redirect_to @role, notice: t('notice.role.updated')
    else
      render action: "edit"
    end
  end

  def destroy
    begin
      @role = Role.find(params[:id])
      @role.destroy
      flash[:success] = t('notice.role.destroyed')
    rescue ActiveRecord::DeleteRestrictionError => e
      @role.errors.add(:base, e)
      flash[:error] = t('exception.' + "#{e}")
    ensure
      redirect_to roles_url
    end
  end
end
