class Ability
  include CanCan::Ability

  def initialize(user, current_company)
    alias_action :show, :new, :edit, :update, :destroy, :create, :to => :most

    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :qm
      can :manage, Function, :company_id => current_company.id
      can :manage, RoleInCompany, :company_id => current_company.id
      can :manage, Department, :company_id => current_company.id
      can :manage, Company, :id => current_company.id

      can :index, User, :companies => { :id => current_company.id }
      can :most, User do |the_user|
        the_user.in_company?(current_company.id)
      end
      can :manage, Substitution, :company_id => current_company.id
      can :manage, Employment, :company_id => current_company.id
      can :manage, DepartmentAffiliation, :company_id => current_company.id
    end
  end
end
