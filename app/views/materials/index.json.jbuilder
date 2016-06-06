json.array!(@materials) do |material|
  json.extract! material, :id, :name, :manufacturer, :description, :extruder_temp, :bed_temp, :notes, :density, :user_id
  json.url material_url(material, format: :json)
end
