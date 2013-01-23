class Ability
  include CanCan::Ability

  def initialize(user, current_company)
    alias_action :show, :new, :edit, :update, :destroy, :to => :most

    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :qm
      can :manage, Company, :id => current_company.id

      can :manage, User, :companies => { :id => current_company.id }
      can :create, User
      can :manage, Substitution, :company_id => current_company.id

      can :manage, Function, :company_id => current_company.id
      can :manage, UserFunctionAssignment, :company_id => current_company.id

      can :manage, Department, :company_id => current_company.id
      can :manage, DepartmentAffiliation, :company_id => current_company.id

      can :manage, RoleInCompany, :company_id => current_company.id
      can :manage, UserRoleInCompanyAssignment, :company_id => current_company.id

      can :manage, ProcessClass, :company_id => current_company.id
      can :manage, BusinessProcess, :company_id => current_company.id
      can :manage, BusinessProcessDepartmentAssignment, :company_id => current_company.id

      can :manage, Note, :company_id => current_company.id
      can :manage, BusinessProcessNoteAssignment, :company_id => current_company.id

      can :manage, Document, :company_id => current_company.id
      can :manage, BusinessProcessDocumentAssignment, :company_id => current_company.id

      can :manage, ProcessIndicator, :company_id => current_company.id
      can :manage, BusinessProcessProcessIndicatorAssignment, :company_id => current_company.id

      can :manage, Instruction, :company_id => current_company.id

      can [:read, :latest, :display], News

    elsif
      can :read, :all, :company_id => current_company.id
      can [:read, :latest], News
    end
  end
end
