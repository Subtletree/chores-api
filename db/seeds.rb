# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'Greg',   email: 'gregscott@homeloanshop.co.nz', ip_range: '192.168.1.10-19')
User.create(name: 'Ryan',   email: 'ryannz@msn.com',               ip_range: '192.168.1.20-29')
User.create(name: 'Connor', email: 'ronn0k@hotmail.com',           ip_range: '192.168.1.30-39')
User.create(name: 'Daniel', email: 'dcs-11@hotmail.com',           ip_range: '192.168.1.40-49')
User.create(name: 'Julia',  email: 'juliacontessa@hotmail.com',    ip_range: '192.168.1.50-59')

kitchen = Job.new(name: 'Kitchen')
kitchen.tasks.build([{name: 'Dishes'}, {name: 'Vacuum/Mop floor'}, {name: 'Clear bench'}, {name: 'Fridge/Microwave/Oven/Pantry'}, {name: 'Put out recycling'}, {name: 'Empty rubbish'}])
kitchen.save
dining = Job.new(name: 'Dining room')
dining.tasks.build([{name: 'Clear table'}, {name: 'Vacuum'}, {name: 'Clear other stuff'}])
dining.save
laundry = Job.new(name: 'Laundry', fortnightly: true)
laundry.tasks.build([{name: 'Do washing'}, {name: 'Clear bench'}, {name: 'Ensure all clothes have been collected from chair'}])
laundry.save
lounge = Job.new(name: 'Lounge + Hall')
lounge.tasks.build([{name: 'Tidy lounge'},{name: 'Clean glass table'}, {name: 'Vacuum lounge'}, {name: 'Clear and vacuum hall'}])
lounge.save
lawns = Job.new(name: 'Lawns', fortnightly: true)
lawns.tasks.build(name: 'Do the lawns')
lawns.save
bathroom = Job.new(name: 'Bathroom')
bathroom.tasks.build([{name: 'Toilets'}, {name: 'Bath'}, {name: 'Shower'}, {name: 'Basins'}, {name: 'Mirror'}, {name: 'Floor'}])
bathroom.save
