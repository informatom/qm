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
  has_many :assignments
  has_many :roles, :through => :assignments
  has_many :substitutions
  has_many :deputies, :through => :substitutions
  has_many :employments
  has_many :department_affiliations
  has_many :departments, :through => :department_affiliations
  has_many :companies, :through => :employments
  has_and_belongs_to_many :functions
  has_and_belongs_to_many :roles_in_company, :join_table => "roles_in_company_users"

  def has_role?(role_sym)
    roles.any? { |r| r.name.underscore.to_sym == role_sym }
  end

  def name
    self.firstname.to_s + " " + self.lastname.to_s + " (" + email + ")"
  end
end
