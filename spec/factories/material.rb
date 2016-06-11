FactoryGirl.define do
  factory :material do
    name 'CF PLA'
    manufacturer 'Colorfabb'
    description 'Colorfabbs PLA/PHA hybrid'
    extruder_temp 220
    bed_temp 65
    notes 'no notes'
    density 1.24
    user
  end
  
  factory :invalid_material, parent: :material do
    name nil
  end
end
