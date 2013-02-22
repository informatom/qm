class UserFunctionAssignmentsController < ApplicationController
  load_and_authorize_resource

  def create
    if @user_function_assignment.save
      redirect_to @user_function_assignment, notice: t('notice.user_function_assignment.created')
    else
      render action: "new"
    end
  end

  def update
    if @user_function_assignment.update_attributes(params[:user_function_assignment])
      redirect_to @user_function_assignment, notice: t('notice.user_function_assignment.updated')
    else
      render action: "edit"
    end
  end

  def destroy
    @user_function_assignment.destroy
    redirect_to user_function_assignments_url
  end
end
