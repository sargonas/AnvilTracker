ActiveAdmin.register Print do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
    index do
        column :id
        column :name
        column :length
        column :weight
        column :price
        column :filament_id
        column :printed_date
        column :volume
        column :extruder_id
        column :print_time
        column :user_id
        column :notes
    end

end
