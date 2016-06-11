require 'rails_helper'

describe HomeController do
    
    before do
        user = FactoryGirl.create(:user)
        allow(controller).to receive(:authenticate_user!).and_return(true)
        allow(controller).to receive(:current_user).and_return(user)
    end
    
    describe "load data for version page" do
        
        it "determine version number success" do
            get :version
            expect(:version_number).not_to eq(nil)
        end
        
        it "determine version hash success" do
            get :version
            expect(:version_hash).not_to eq(nil)
        end
        
        it "determine version date success" do
            get :version
            expect(:version_date).not_to eq(nil)
        end
    end
end