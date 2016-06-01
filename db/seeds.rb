#Filament seeds
Filament.create(name: 'CF White #1', material: 'PLA', color: 'white', length: 90000, weight: 750, cost: 25.00, diameter: 1.75, archived: false)
Filament.create(name: 'Atomic Black #1', material: 'PLA', color: 'black', length: 90000, weight: 750, cost: 25.00, diameter: 1.75, archived: true)
Filament.create(name: 'Atomic Black #2', material: 'PLA', color: 'black', length: 90000, weight: 750, cost: 25.00, diameter: 1.75, archived: false)
Filament.create(name: 'CFnGen Black Sample #1', material: 'nGen', color: 'black', length: 900, weight: 150, cost: 5.00, diameter: 2.85, archived: false)
Filament.create(name: 'CF XTC Clear #1', material: 'XTC', color: 'clear', length: 90000, weight: 750, cost: 40.00, diameter: 2.85, archived: true)
Filament.create(name: 'CF XTC Clear #2', material: 'XTC', color: 'clear', length: 90000, weight: 750, cost: 40.00, diameter: 2.85, archived: false)
#Print seeds
Print.create(name: 'Marvin nGen Test', length: 350, weight: 2.80, price: 0.00, filament_id: 4, printed_date: "2015-02-21", volume: 2.26, print_time: 2661, notes: "This is a test note for a print.")
Print.create(name: 'Tesla Coil Funnel', length: 7390, weight: 44, price: 17.82, filament_id: 4, printed_date: "2015-02-21", volume: 47.15, print_time: 16576, notes: "This is a second test note.")
Print.create(name: 'Nes Pi Case', length: 11730, weight: 93.56, price: 50.00, filament_id: 1, printed_date: "2015-03-05", volume: 74.86, print_time: 34289)
#Default user seeding
user = User.create! :email => 'admin@example.com', :password => 'changeme', :password_confirmation => 'changeme'