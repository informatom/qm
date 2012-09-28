class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :show, :new, :edit, :update, :destroy, :create, :to => :most

    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :qm
      can :manage, Function, :company_id => user.current_company_id
      can :manage, RoleInCompany, :company_id => user.current_company_id
      can :manage, Department, :company_id => user.current_company_id
      can :manage, Company, :id => user.current_company_id

      can :index, User, :companies => { :id => user.current_company_id }
      can :most, User do |the_user|
        the_user.in_company?(user.current_company_id)
      end

      can :index, Substitution
      can :most, Substitution do |subst|
        @user = User.find_by_id(subst.user_id)
        @deputy = User.find_by_id(subst.deputy_id)
        can?(:most, @user) && can?(:most, @deputy )
      end

    end
  end
end
