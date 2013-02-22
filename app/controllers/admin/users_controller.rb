class Admin::UsersController < ApplicationController
  load_and_authorize_resource

  def create
    @user.employments.build(company_id: current_company.id)
    if @user.save
      redirect_to admin_user_path(@user), notice: t('notice.user.created')
    else
      render action: "new"
    end
  end

  def update
    # keep old password if neither password nor password_confirmation are provided
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    if @user.update_attributes(params[:user])
      redirect_to admin_user_path(@user), notice: t('notice.user.updated')
    else
      render action: "edit"
    end
  end

  def destroy
    begin
      @user.destroy
      flash[:success] = t('notice.user.destroyed')
    rescue ActiveRecord::DeleteRestrictionError => e
      @user.errors.add(:base, e)
      flash[:error] = t('exception.' + "#{e}")
    ensure
      redirect_to admin_users_url
    end
  end
end
