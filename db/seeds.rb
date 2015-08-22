# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(:title => "ICL",:first_name =>"ICL",:last_name => "ICL",email:"admin@icl.com",password:"123456789",password_confirmation:"123456789", confirmed_at: Time.now )
