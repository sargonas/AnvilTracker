class PrintsController < ApplicationController
    helper_method :sort_column, :sort_direction
    
    #CSV import support
    def import
        Print.import(params[:file])
        redirect_to root_url, notice: "Prints imported."
    end
    
    def index
        @prints = Print.order(sort_column + " " + sort_direction).where(:user_id => current_user.id)
    end
    
    def show
        @print = current_user.prints.find(params[:id])
    end
    
    def new
        @print = Print.new
        @filament_options = Filament.where(:archived => false).map{ |f| [ f.name, f.id ] }
    end
    
    def edit
        @print = current_user.prints.find(params[:id])
        #does archived false belong here? let's investigate some time
        @filament_options = Filament.where(:archived => false).map{ |f| [ f.name, f.id ] }
    end
    
    def create
        @print = Print.new(print_params)
        @print.user_id = current_user.id
        
        if @print.save
            redirect_to @print
        else
            render 'new'
        end
    end
    
    def update
        @print = current_user.prints.find(params[:id])
        @print.user_id = current_user.id
 
        if @print.update(print_params)
            redirect_to @print
        else
            render 'edit'
        end
    end
    
    def destroy
        @print = current_user.prints.find(params[:id])
        @print.destroy
 
        redirect_to prints_path
    end
    
    private
        def print_params
            params.require(:print).permit(:name, :length, :weight, :price, :filament_id, :printed_date, :volume, :extruder_id, :print_time)
        end
        #controls to help with sorting the indexes
        def sort_column
            Print.column_names.include?(params[:sort]) ? params[:sort] : "id"
        end
  
        def sort_direction
            %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
        end
        #does this actually do anything? This might be leftover old experimental code. Need to remove if so!
        #def print_cost
         #   @print_cost = number_to_currency((Filament.find(print.filament_id).cost/Filament.find(print.filament_id).length)*print.length)
          #  puts "ran that weird code!"
        #end
    rescue_from ActiveRecord::RecordNotFound do
        flash[:notice] = 'You do not have access to do that'
        redirect_to prints_path
    end    
end