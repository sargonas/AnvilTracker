FactoryGirl.define do
  factory :material do
    name 'CF PLA'
    manufacturer 'Colorfabb'
    description 'Colorfabbs PLA/PHA hybrid'
    extruder_temp 220
    bed_temp 65
    notes 'none'
    density 1.24
  end
end
