class Ability
  include CanCan::Ability

  def initialize(user, current_company)
    alias_action :show, :new, :edit, :update, :destroy, :to => :most

    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all

    elsif user.has_role? :qm
      can [:edit, :update, :organigram], Company, :id => current_company.id
      can :manage, Company, :users => { :id => user.id}

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
      can :manage, NoteProcessStepAssignment, :company_id => current_company.id

      can :manage, Document, :company_id => current_company.id
      can :manage, BusinessProcessDocumentAssignment, :company_id => current_company.id
      can :manage, DocumentProcessStepAssignment, :company_id => current_company.id

      can :manage, ProcessIndicator, :company_id => current_company.id
      can :manage, BusinessProcessProcessIndicatorAssignment, :company_id => current_company.id

      can :manage, Instruction, :company_id => current_company.id
      can :manage, InstructionProcessStepAssignment, :company_id => current_company.id
      can :manage, InstructionDocumentAssignment, :company_id => current_company.id

      can :manage, ProcessStep, :company_id => current_company.id
      can :manage, SequenceFlow, :company_id => current_company.id

      can :read, FlowObject
      can :read, Employment, :company_id => current_company.id
      can [:new, :create], Employment

      can [:read, :latest, :display], News
      can :read, Role

    else
      can [:read, :organigram], Company, :users => {:id => user.id}

      can :read, User, :companies => { :id => current_company.id }
      can :read, Substitution, :company_id => current_company.id

      can :read, Function, :company_id => current_company.id
      can :read, UserFunctionAssignment, :company_id => current_company.id

      can :read, Department, :company_id => current_company.id
      can :read, DepartmentAffiliation, :company_id => current_company.id

      can :read, RoleInCompany, :company_id => current_company.id
      can :read, UserRoleInCompanyAssignment, :company_id => current_company.id

      can :read, ProcessClass, :company_id => current_company.id
      can [:read, :diagram, :step_diagram], BusinessProcess, :company_id => current_company.id
      can :read, BusinessProcessDepartmentAssignment, :company_id => current_company.id

      can :read, Note, :company_id => current_company.id
      can :read, BusinessProcessNoteAssignment, :company_id => current_company.id
      can :read, NoteProcessStepAssignment, :company_id => current_company.id

      can :read, Document, :company_id => current_company.id
      can :read, BusinessProcessDocumentAssignment, :company_id => current_company.id
      can :read, DocumentProcessStepAssignment, :company_id => current_company.id

      can :read, ProcessIndicator, :company_id => current_company.id
      can :read, BusinessProcessProcessIndicatorAssignment, :company_id => current_company.id

      can :read, Instruction, :company_id => current_company.id
      can :read, InstructionProcessStepAssignment, :company_id => current_company.id
      can :read, InstructionDocumentAssignment, :company_id => current_company.id

      can :read, ProcessStep, :company_id => current_company.id
      can :read, SequenceFlow, :company_id => current_company.id

      can :read, FlowObject

      can :read, Employment, :company_id => current_company.id
      can [:read, :latest, :display], News
      can :read, Role
      can :create, Submission
    end
  end
end
