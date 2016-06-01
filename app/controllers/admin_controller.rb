class AdminController < ApplicationController
    before_action :authenticate_admin!
    helper_method :sort_column, :sort_direction
    
    def authenticate_admin!
    #check if admin flag is true
    unless current_user.admin
      #if not bounce out
      redirect_to root_path
    end
    end
    
    def index
    end
    
    def home
      @users = User.order(sort_column + " " + sort_direction)
    end
    
    def show
        @user = User.find(params[:id])
    end
    
    def new
        @user = User.new
    end
    
    def edit
        @user = User.find(params[:id])
    end
    
    def create
        @user = User.new(user_params)
        @user.user_id = current_user.id
        
        if @user.save
            redirect_to @user
        else
            render 'new'
        end
    end
    
    def update
        @user = User.find(params[:id])
        @user.user_id = current_user.id
    
        if @user.update(user_params)
            redirect_to @user
        else
            render 'edit'
        end
    end
    
    def destroy
        @user = User.find(params[:id])
        @user.destroy
    
        redirect_to admin_home, notice: "User deleted"
    end
    
    private
        def user_params
            params.require(:user).permit(:id, :email, :last_sign_in_at, :last_sign_in_ip)
        end
        def sort_column
            Filament.column_names.include?(params[:sort]) ? params[:sort] : "id"
        end
    
        def sort_direction
            %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
        end

end
