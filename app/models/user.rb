class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role_ids, :role

  validates_uniqueness_of :email
  validates_presence_of :firstname
  validates_presence_of :lastname
  validates_presence_of :company

  ROLES = %w[admin qm_user]

  has_many :assignments
  has_many :roles, :through => :assignments
  has_ancestry
  has_many :substitutions
  has_many :deputies, :through => :substitutions
  has_many :employments
  has_many :companies, :through => :employments
  has_and_belongs_to_many :functions
  has_and_belongs_to_many :roles_in_company, :join_table => "roles_in_company_users"

  def has_role?(role_sym)
    roles.any? { |r| r.name.underscore.to_sym == role_sym }
  end
end
