class PrintsController < ApplicationController
    def index
        @prints = Print.all
    end
    
    def show
        @print = Print.find(params[:id])
    end
    
    def new
        @print = Print.new
    end
    
    def edit
        @print = Print.find(params[:id])
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
            params.require(:print).permit(:name, :length, :weight, :price)
        end
        
end