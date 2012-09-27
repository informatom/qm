class Admin::UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to admin_user_path(@user), notice: 'User was successfully created.'
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

    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to admin_user_path(@user), notice: 'User was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    begin
      @user = User.find(params[:id])
      @user.destroy
      flash[:success] = "user successfully destroyed."
    rescue ActiveRecord::DeleteRestrictionError => e
      @user.errors.add(:base, e)
      flash[:error] = "#{e}"
    ensure
      redirect_to admin_users_url
    end
  end
end
