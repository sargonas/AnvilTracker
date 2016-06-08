ActiveAdmin.register Filament do

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
        column :color
        column :length
        column :weight
        column :cost
        column :diameter
        column :material_id
        column :user_id
        column :archived
    end

end
