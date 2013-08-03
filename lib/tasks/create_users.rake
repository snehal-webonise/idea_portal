namespace :employees do
  desc "Create Users"
  task :create_users => :environment do
    puts "Create user offline"
      users = [{"name" => "Snehal","email"=>"snehal@webonisleab.com", "password"=>"WL001"}, 
        {"name" => "Unnati", "email"=>"unnati@webonisleab.com", "password"=>"WL002"}, 
        {"name" => "Kalpesh", "email"=>"kalpesh@webonisleab.com", "password"=>"WL003"}]
    
      users.each do |user|
        user = User.new(:name => user["name"], :email => user["email"], :password => user["password"], :password_confirmation => user["password"], :emp_id => user["password"])
        user.save(:validate => false)
        UserMailer.account_created(user).deliver
      end
  end
end