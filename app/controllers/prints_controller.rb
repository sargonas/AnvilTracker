class PrintsController < ApplicationController
    helper_method :sort_column, :sort_direction
    def import
        Print.import(params[:file])
        redirect_to root_url, notice: "Prints imported."
    end
    
    def index
        @prints = Print.order(sort_column + " " + sort_direction)
    end
    
    def show
        @print = Print.find(params[:id])
    end
    
    def new
        @print = Print.new
        @filament_options = Filament.all.map{ |f| [ f.name, f.id ] }
    end
    
    def edit
        @print = Print.find(params[:id])
        @filament_options = Filament.all.map{ |f| [ f.name, f.id ] }
    end
    
    def create
        @print = Print.new(print_params)
        
        if @print.save
            redirect_to @print
        else
            render 'new'
        end
    end
    
    def update
        @print = Print.find(params[:id])
 
        if @print.update(print_params)
            redirect_to @print
        else
            render 'edit'
        end
    end
    
    def destroy
        @print = Print.find(params[:id])
        @print.destroy
 
        redirect_to prints_path
    end
    
    private
        def print_params
            params.require(:print).permit(:name, :length, :weight, :price, :filament_id, :printed_date, :volume, :extruder_id, :print_time)
        end
        def sort_column
            Filament.column_names.include?(params[:sort]) ? params[:sort] : "id"
        end
  
        def sort_direction
            %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
        end
        #does this actually do anything? This might be leftover old experimental code. Need to remove if so!
        #def print_cost
         #   @print_cost = number_to_currency((Filament.find(print.filament_id).cost/Filament.find(print.filament_id).length)*print.length)
          #  puts "ran that weird code!"
        #end
        
end