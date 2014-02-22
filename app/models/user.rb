class User < ActiveRecord::Base
  has_ancestry
  has_paper_trail

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :role_ids, 
                  :role, :firstname, :lastname, :parent_id, :deputy_ids,
                  :function_ids, :role_in_company_ids, :department_ids, :substitutions_attributes, 
                  :user_function_assignments_attributes, :user_role_in_company_assignments_attributes,
                  :department_affiliations_attributes, :assignment_attributes, :replacements_attributes

  validates_uniqueness_of :email
  validates :firstname, :email, :lastname, :presence => true

  ROLES = %w[admin qm_user]
  has_many :assignments, :dependent => :restrict, :inverse_of => :user
  has_many :roles, :through => :assignments, :dependent => :restrict, :inverse_of => :users

  has_many :substitutions, :inverse_of => :user, :dependent => :restrict
  has_many :deputies, :through => :substitutions, :dependent => :restrict, :inverse_of => :users
  accepts_nested_attributes_for :substitutions, :allow_destroy => true

  has_many :replacements, :inverse_of => :deputy, :dependent => :restrict, :class_name => "Substitution", 
           :foreign_key => "deputy_id"
  has_many :replaces, :through => :replacements, :dependent => :restrict, :source => :user, :inverse_of => :deputies
  accepts_nested_attributes_for :replacements, :allow_destroy => true

  has_many :employments, :dependent => :destroy, :inverse_of => :user
  has_many :companies, :through => :employments, :inverse_of => :users

  has_many :department_affiliations, :dependent => :restrict, :inverse_of => :user
  has_many :departments, :through => :department_affiliations, :dependent => :restrict, :inverse_of => :users
  accepts_nested_attributes_for :department_affiliations, :allow_destroy => true

  has_many :user_function_assignments, :inverse_of => :user
  has_many :functions, :through => :user_function_assignments, :dependent => :restrict, :inverse_of => :users
  accepts_nested_attributes_for :user_function_assignments, :allow_destroy => true

  has_many :user_role_in_company_assignments, :inverse_of => :user, :dependent => :restrict
  has_many :roles_in_company, :through => :user_role_in_company_assignments, :dependent => :restrict, :inverse_of => :users
  accepts_nested_attributes_for :user_role_in_company_assignments, :allow_destroy => true

  has_many :business_processes, :dependent => :restrict, :foreign_key => "owner_id", :inverse_of => :owner

  has_many :charged_instructions, :class_name => "Instruction", :dependent => :restrict,
           :foreign_key => "in_charge_id", :inverse_of => :in_charge
  has_many :controlled_instructions, :class_name => "Instruction", :dependent => :restrict,
           :foreign_key => "controlled_by_id", :inverse_of => :controlled_by
  has_many :released_instructions, :class_name => "Instruction", :dependent => :restrict,
           :foreign_key => "released_by_id", :inverse_of => :released_by

  has_many :controlled_documents, :class_name => "Document", :dependent => :restrict,
           :foreign_key => "controlled_by_id", :inverse_of => :controlled_by
  has_many :released_documends, :class_name => "Document", :dependent => :restrict,
           :foreign_key => "released_by_id", :inverse_of => :released_by

  has_many :controlled_notes, :class_name => "Note", :dependent => :restrict,
           :foreign_key => "controlled_by_id", :inverse_of => :controlled_by
  has_many :released_notes, :class_name => "Note", :dependent => :restrict,
           :foreign_key => "released_by_id", :inverse_of => :released_by

  has_many :controlled_functions, :class_name => "Function", :dependent => :restrict,
           :foreign_key => "controlled_by_id", :inverse_of => :controlled_by
  has_many :released_functions, :class_name => "Function", :dependent => :restrict,
           :foreign_key => "released_by_id", :inverse_of => :released_by

  has_many :controlled_business_processes, :class_name => "BusinessProcess", :dependent => :restrict,
           :foreign_key => "controlled_by_id", :inverse_of => :controlled_by
  has_many :released_business_processes, :class_name => "BusinessProcess", :dependent => :restrict,
           :foreign_key => "released_by_id", :inverse_of => :released_by

  scope :in_company, lambda { |company_id| (includes(:employments).merge(Employment.in_company(company_id))) }

  def has_role?(role_sym)
    roles.any? { |r| r.name.underscore.to_sym == role_sym }
  end

  def has_not_role? (role_sym)
    !has_role?(role_sym)
  end

  def name
    self.firstname.to_s + " " + self.lastname.to_s
  end

  def shortname
    self.firstname.to_s + " " + self.lastname.to_s
  end

  def in_company?(id)
    self.employments.any? {|emp| emp.company_id == id.to_i}
  end
end
