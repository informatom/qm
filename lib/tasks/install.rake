namespace :qm do
  desc "Initial User and Roles"
  task :initialize => :environment do
    @admin = Role.new
    @admin.name = "admin"
    @admin.save

    @user = User.new
    @user.email = "stefan.haslinger@mittenin.at"
    @user.password = "admin123"
    @user.password_confirmation = "admin123"
    @user.assignments.build(:role => @admin)
    @user.save
  end
end
