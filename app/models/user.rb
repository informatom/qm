class User < ActiveRecord::Base
  has_ancestry

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role_ids, :role, :firstname, :lastname, :parent_id, :deputy_ids,
                  :function_ids, :role_in_company_ids, :department_ids

  validates_uniqueness_of :email
  validates_presence_of :firstname
  validates_presence_of :email
  validates_presence_of :lastname

  ROLES = %w[admin qm_user]
  has_many :assignments, :dependent => :restrict
  has_many :roles, :through => :assignments, :dependent => :restrict

  has_many :substitutions, :dependent => :restrict
  has_many :deputies, :through => :substitutions, :dependent => :restrict

  has_many :employments, :dependent => :restrict
  has_many :companies, :through => :employments, :dependent => :restrict

  has_many :department_affiliations, :dependent => :restrict
  has_many :departments, :through => :department_affiliations, :dependent => :restrict


  has_many :user_function_assignments
  has_many :functions, :through => :user_function_assignments, :dependent => :restrict

  has_many :user_role_in_company_assignments, :dependent => :restrict
  has_many :roles_in_company, :through => :user_role_in_company_assignments, :dependent => :restrict

  def has_role?(role_sym)
    roles.any? { |r| r.name.underscore.to_sym == role_sym }
  end

  def has_not_role? (role_sym)
    !has_role?(role_sym)
  end

  def name
    self.firstname.to_s + " " + self.lastname.to_s + " (" + email + ")"
  end

  def current_company_id=(id)
    @current_company_id = id
  end

  def current_company_id
    @current_company_id
  end

  def in_company?(id)
    self.employments.any? {|emp| emp.company_id == id.to_i}
  end
end
