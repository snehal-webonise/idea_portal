namespace :employees do
  desc "Create Users"
  task :create_users => :environment do
    puts "Create user offline"
      users = [{"name" => "Snehal","email"=>"snehal@weboniselab.com", "password"=>"WL001"}, 
        {"name" => "Unnati", "email"=>"unnati@weboniselab.com", "password"=>"WL002"}, 
        {"name" => "Kalpesh", "email"=>"kalpesh@weboniselab.com", "password"=>"WL003"},
        {"name" => "Datta", "email"=>"datta@weboniselab.com", "password"=>"WL004"},
        {"name" => "Deepti", "email"=>"deepti@weboniselab.com", "password"=>"WL005"},
        {"name" => "Vasundhara", "email"=>"vasundhara@weboniselab.com", "password"=>"WL006"},
        {"name" => "Priyanka", "email"=>"priyanka@weboniselab.com", "password"=>"WL007"},
        {"name" => "Ranjeeth", "email"=>"ranjeeth@weboniselab.com", "password"=>"WL008"},
        {"name" => "Ketan", "email"=>"ketan@weboniselab.com", "password"=>"WL009"},
        {"name" => "Apurva", "email"=>"apurva@weboniselab.com", "password"=>"WL010"}
      ]
    
      users.each do |user|
        user = User.new(:name => user["name"], :email => user["email"], :password => user["password"], :password_confirmation => user["password"], :emp_id => user["password"])
        user.save(:validate => false)
        UserMailer.account_created(user).deliver
      end
  end
end