class UserRoleInCompanyAssignmentsController < ApplicationController
  def index
    @user_role_in_company_assignments = UserRoleInCompanyAssignment.all
  end

  def show
    @user_role_in_company_assignment = UserRoleInCompanyAssignment.find(params[:id])
  end

  def new
    @user_role_in_company_assignment = UserRoleInCompanyAssignment.new
  end

  def edit
    @user_role_in_company_assignment = UserRoleInCompanyAssignment.find(params[:id])
  end

  def create
    @user_role_in_company_assignment = UserRoleInCompanyAssignment.new(params[:user_role_in_company_assignment])

    if @user_role_in_company_assignment.save
      redirect_to @user_role_in_company_assignment, notice: 'User role in company assignment was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @user_role_in_company_assignment = UserRoleInCompanyAssignment.find(params[:id])

    if @user_role_in_company_assignment.update_attributes(params[:user_role_in_company_assignment])
      redirect_to @user_role_in_company_assignment, notice: 'User role in company assignment was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @user_role_in_company_assignment = UserRoleInCompanyAssignment.find(params[:id])
    @user_role_in_company_assignment.destroy

    redirect_to user_role_in_company_assignments_url
  end
end
