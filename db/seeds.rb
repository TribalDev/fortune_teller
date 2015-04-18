# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Message.create(advice: 'Yes!', author: 'Jason')
Message.create(advice: "No don't do it!", author: 'EightBall')
Message.create(advice: "Try Again", author: 'EightBall')
