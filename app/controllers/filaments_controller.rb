class FilamentsController < ApplicationController
    helper_method :sort_column, :sort_direction
    
    #CSV import logic
    def import
        Filament.import(params[:file])
        redirect_to root_url, notice: "Filaments imported."
    end
    
    def index
        if params[:archived]
            @filaments = Filament.order(sort_column + " " + sort_direction).where(:archived => params[:archived])
        else
            @filaments = Filament.order(sort_column + " " + sort_direction)
        end
    end
    
    def show
        @filament = Filament.find(params[:id])
    end
    
    def new
        @filament = Filament.new
    end
    
    def edit
        @filament = Filament.find(params[:id])
    end
    
    def create
        @filament = Filament.new(filament_params)
        
        if @filament.save
            redirect_to @filament
        else
            render 'new'
        end
    end
    
    def update
        @filament = Filament.find(params[:id])
 
        if @filament.update(filament_params)
            redirect_to @filament
        else
            render 'edit'
        end
    end
    
    def destroy
        @filament = Filament.find(params[:id])
        @filament.destroy
 
        redirect_to filaments_path
    end
    
    private
        def filament_params
            params.require(:filament).permit(:name, :material, :color, :length, :weight, :cost, :diameter, :archived)
        end
        
        #extras to support the sorting of the index table
        def sort_column
            Filament.column_names.include?(params[:sort]) ? params[:sort] : "id"
        end
  
        def sort_direction
            %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
        end
    
end