class Deputy < User
  has_many :users, :through => :substitutions, :dependent => :restrict
end