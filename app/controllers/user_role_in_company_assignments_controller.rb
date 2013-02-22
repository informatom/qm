class UserRoleInCompanyAssignmentsController < ApplicationController
  load_and_authorize_resource

  def create
    if @user_role_in_company_assignment.save
      redirect_to @user_role_in_company_assignment, notice: t('notice.user_role_in_company_assignment.created')
    else
      render action: "new"
    end
  end

  def update
    if @user_role_in_company_assignment.update_attributes(params[:user_role_in_company_assignment])
      redirect_to @user_role_in_company_assignment, notice: t('notice.user_role_in_company_assignment.created')
    else
      render action: "edit"
    end
  end

  def destroy
    @user_role_in_company_assignment.destroy
    redirect_to user_role_in_company_assignments_url
  end
end
