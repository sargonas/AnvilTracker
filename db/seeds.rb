#Filament seeds
Filament.create(name: 'USER1 CF White #1', material: 'PLA', color: 'white', length: 90000, weight: 750, cost: 25.00, diameter: 1.75, archived: false, user_id: 1)
Filament.create(name: 'USER1 Atomic Black #1', material: 'PLA', color: 'black', length: 90000, weight: 750, cost: 25.00, diameter: 1.75, archived: true, user_id: 1)
Filament.create(name: 'USER1 Atomic Black #2', material: 'PLA', color: 'black', length: 90000, weight: 750, cost: 25.00, diameter: 1.75, archived: false, user_id: 1)
Filament.create(name: 'USER1 CFnGen Black Sample #1', material: 'nGen', color: 'black', length: 900, weight: 150, cost: 5.00, diameter: 2.85, archived: false, user_id: 1)
Filament.create(name: 'USER1 CF XTC Clear #1', material: 'XTC', color: 'clear', length: 90000, weight: 750, cost: 40.00, diameter: 2.85, archived: true, user_id: 1)
Filament.create(name: 'USER1 CF XTC Clear #2', material: 'XTC', color: 'clear', length: 90000, weight: 750, cost: 40.00, diameter: 2.85, archived: false, user_id: 1)
Filament.create(name: 'USER2 CF White #1', material: 'PLA', color: 'white', length: 90000, weight: 750, cost: 25.00, diameter: 1.75, archived: false, user_id: 2)
Filament.create(name: 'USER2 Atomic Black #1', material: 'PLA', color: 'black', length: 90000, weight: 750, cost: 25.00, diameter: 1.75, archived: true, user_id: 2)
Filament.create(name: 'USER2 Atomic Black #2', material: 'PLA', color: 'black', length: 90000, weight: 750, cost: 25.00, diameter: 1.75, archived: false, user_id: 2)
Filament.create(name: 'USER2 CFnGen Black Sample #1', material: 'nGen', color: 'black', length: 900, weight: 150, cost: 5.00, diameter: 2.85, archived: false, user_id: 2)
Filament.create(name: 'USER2 CF XTC Clear #1', material: 'XTC', color: 'clear', length: 90000, weight: 750, cost: 40.00, diameter: 2.85, archived: true, user_id: 2)
Filament.create(name: 'USER2 CF XTC Clear #2', material: 'XTC', color: 'clear', length: 90000, weight: 750, cost: 40.00, diameter: 2.85, archived: false, user_id: 2)
#Print seeds
Print.create(name: 'USER1 Marvin nGen Test', length: 350, weight: 2.80, price: 0.00, filament_id: 4, printed_date: "2015-02-21", volume: 2.26, print_time: 2661, user_id: 1)
Print.create(name: 'USER1 Tesla Coil Funnel', length: 7390, weight: 44, price: 17.82, filament_id: 4, printed_date: "2015-02-21", volume: 47.15, print_time: 16576, user_id: 1)
Print.create(name: 'USER1 Nes Pi Case', length: 11730, weight: 93.56, price: 50.00, filament_id: 1, printed_date: "2015-03-05", volume: 74.86, print_time: 34289, user_id: 1)
Print.create(name: 'USER2 Marvin nGen Test', length: 350, weight: 2.80, price: 0.00, filament_id: 4, printed_date: "2015-02-21", volume: 2.26, print_time: 2661, user_id: 2)
Print.create(name: 'USER2 Tesla Coil Funnel', length: 7390, weight: 44, price: 17.82, filament_id: 4, printed_date: "2015-02-21", volume: 47.15, print_time: 16576, user_id: 2)
Print.create(name: 'USER2 Nes Pi Case', length: 11730, weight: 93.56, price: 50.00, filament_id: 1, printed_date: "2015-03-05", volume: 74.86, print_time: 34289, user_id: 2)
#Default user seeding
user = User.create! :email => 'admin@example.com', :password => 'changeme', :password_confirmation => 'changeme', :admin => 1
user = User.create! :email => 'user2@example.com', :password => 'changeme', :password_confirmation => 'changeme', :admin => 0