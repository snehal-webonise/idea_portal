namespace :guidestar do
  desc "Create Users"
  task :monthly_business_updates => :environment do
    puts "Create user offline"
      users = [{"name" => "Snehal","email"=>"unnati@webonisleab.com", "password"=>"WL001"}, 
        {"name" => "Unnati", "email"=>"snehal@webonisleab.com", "password"=>"WL002"}, 
        {"name" => "Prerana", "email"=>"prerana@webonisleab.com", "password"=>"WL003"}]
    
      users.each do |user|
        user = User.new(:name => user["name"], :email_id => user["email"], :password => user["password"])
        user.save(:validate => false)
      end
  end
end