# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'Ryan', email: 'ryannz@msn.com')
User.create(name: 'Julia', email: 'juliacontessa@hotmail.com')
User.create(name: 'Greg', email: 'gregscott@homeloanshop.co.nz')
User.create(name: 'Connor', email: 'ronn0k@hotmail.com')
User.create(name: 'Daniel', email: 'dcs-11@hotmail.com')

kitchen = Job.new(name: 'Kitchen')
kitchen.tasks.build([{name: 'Dishes'}, {name: 'Clean out fridge'}, {name: 'Put out recycling'}, {name: 'Empty rubbish'}])
kitchen.save
dining = Job.new(name: 'Dining room')
dining.tasks.build([{name: 'Clear table'}, {name: 'Vacuum'}])
dining.save
laundry = Job.new(name: 'Laundry')
laundry.tasks.build([{name: 'Do washing'}, {name: 'Clear bench'}])
laundry.save
lounge = Job.new(name: 'Lounge')
lounge.tasks.build([{name: 'Clean glass table'}, {name: 'Vacuum'}])
lounge.save
lawns = Job.new(name: 'Lawns')
lawns.tasks.build(name: 'Lawns')
lawns.save
