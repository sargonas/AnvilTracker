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
            params.require(:filament).permit(:name, :material, :color, :length, :weight, :cost)
        end
        
end
