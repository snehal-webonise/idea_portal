# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@user = User.new(:name => "Admin", :email => "prerana@weboniselab.com", :password => "idea123", :password_confirmation => "idea123", :is_admin => true)
@user.save(:validate => false)
