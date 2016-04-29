class FilamentsController < ApplicationController
    def index
        @filaments = Filament.all
    end
    
    def show
        @filament = Filament.find(params[:id])
    end
    
    def new
    end
    
    def create
        @filament = Filament.new(filament_params)
        
        @filament.save
        redirect_to @filament
    end
    
    private
        def filament_params
            params.require(:filament).permit(:name, :material, :color, :length, :weight, :cost)
        end
        
end
