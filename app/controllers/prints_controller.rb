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
    
    def create
        @print = Print.new(print_params)
        
        if @print.save
            redirect_to @print
        else
            render 'new'
        end
    end
    
    private
        def print_params
            params.require(:print).permit(:name, :length, :weight, :price)
        end
        
end