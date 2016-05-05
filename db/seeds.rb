# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Filament.create(name: 'CF White 1', material: 'PLA', color: 'white', length: 90000, weight: 750, cost: 25.00, diameter: 1.75, archived: false)
Filament.create(name: 'CF Black 1', material: 'PLA', color: 'black', length: 90000, weight: 750, cost: 25.00, diameter: 1.75, archived: true)
Filament.create(name: 'CF nGen Black Sample 1', material: 'nGen', color: 'black', length: 900, weight: 150, cost: 5.00, diameter: 2.85, archived: false)
Filament.create(name: 'CF XTC Clear 1', material: 'XTC', color: 'clear', length: 90000, weight: 750, cost: 40.00, diameter: 2.85, archived: true)
Print.create(name: 'Marvin Test', length: 500, weight: 10, price: 5.00, filament_id: 3, printed_date: "2015-02-21", volume: 12.01)
Print.create(name: 'Nes Pi Case', length: 1500, weight: 80, price: 15.00, filament_id: 1, printed_date: "2015-03-05", volume: 22.72)
user = User.create! :email => 'admin@example.com', :password => 'changeme', :password_confirmation => 'changeme'