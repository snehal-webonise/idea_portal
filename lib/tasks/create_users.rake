namespace :employees do
  desc "Create Users"
  task :create_users => :environment do
    puts "Create user offline"
      users = [{"name" => "Snehal","email"=>"snehal@webonisleab.com", "password"=>"WL001"}, 
        {"name" => "Unnati", "email"=>"unnati@webonisleab.com", "password"=>"WL002"}, 
        {"name" => "Kalpesh", "email"=>"kalpesh@webonisleab.com", "password"=>"WL003"},
        {"name" => "Datta", "email"=>"datta@webonisleab.com", "password"=>"WL004"},
        {"name" => "Deepti", "email"=>"deepti@webonisleab.com", "password"=>"WL005"},
        {"name" => "Vasundhara", "email"=>"vasundhara@webonisleab.com", "password"=>"WL006"},
        {"name" => "Priyanka", "email"=>"priyanka@webonisleab.com", "password"=>"WL007"},
        {"name" => "Ranjeeth", "email"=>"ranjeeth@webonisleab.com", "password"=>"WL008"},
        {"name" => "Ketan", "email"=>"ketan@webonisleab.com", "password"=>"WL009"},
        {"name" => "Apurva", "email"=>"apurva@webonisleab.com", "password"=>"WL010"}
      ]
    
      users.each do |user|
        user = User.new(:name => user["name"], :email => user["email"], :password => user["password"], :password_confirmation => user["password"], :emp_id => user["password"])
        user.save(:validate => false)
        UserMailer.account_created(user).deliver
      end
  end
end