class Deputy < User
  has_many :users, :through => :substitutions, :dependent => :restrict, :inverse_of => :deputies
end
