class FilamentsController < ApplicationController
    def import
        Filament.import(params[:file])
        redirect_to root_url, notice: "Filaments imported."
    end
    
    def index
        if params[:archived]
            @filaments = Filament.where(:archived => params[:archived])
        else
            @filaments = Filament.order(:id)
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
end