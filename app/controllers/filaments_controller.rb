class FilamentsController < ApplicationController
    def index
        @filaments = Filament.all
    end
    
    def show
        @filament = Filament.find(params[:id])
    end
    
    def new
        @filament = Filament.new
    end
    
    def create
        @filament = Filament.new(filament_params)
        
        if @filament.save
            redirect_to @filament
        else
            render 'new'
        end
    end
    
    private
        def filament_params
            params.require(:filament).permit(:name, :material, :color, :length, :weight, :cost)
        end
        
end
