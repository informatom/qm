class UserFunctionAssignmentsController < ApplicationController
  load_and_authorize_resource

  def index
    @user_function_assignments = UserFunctionAssignment.all
  end

  def show
    @user_function_assignment = UserFunctionAssignment.find(params[:id])
  end

  def new
    @user_function_assignment = UserFunctionAssignment.new
  end

  def edit
    @user_function_assignment = UserFunctionAssignment.find(params[:id])
  end

  def create
    @user_function_assignment = UserFunctionAssignment.new(params[:user_function_assignment])

    if @user_function_assignment.save
      redirect_to @user_function_assignment, notice: 'User function assignment was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @user_function_assignment = UserFunctionAssignment.find(params[:id])

    if @user_function_assignment.update_attributes(params[:user_function_assignment])
      redirect_to @user_function_assignment, notice: 'User function assignment was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @user_function_assignment = UserFunctionAssignment.find(params[:id])
    @user_function_assignment.destroy

    redirect_to user_function_assignments_url
  end
end
