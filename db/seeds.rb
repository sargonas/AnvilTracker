# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Filament.create(name: 'CF White 1', material: 'PLA', color: 'white', length: 90000, weight: 750, cost: 25.00)
Filament.create(name: 'CF Black 1', material: 'PLA', color: 'black', length: 90000, weight: 750, cost: 25.00)
Filament.create(name: 'CF nGen Black Sample 1', material: 'nGen', color: 'black', length: 900, weight: 150, cost: 5.00)
Filament.create(name: 'CF XTC Clear 1', material: 'XTC', color: 'clear', length: 90000, weight: 750, cost: 40.00)
Print.create(name: 'Marvin Test', length: 500, weight: 10, price: 5.00, filament_id: 3)
Print.create(name: 'Nes Pi Case', length: 1500, weight: 80, price: 15.00, filament_id: 1)