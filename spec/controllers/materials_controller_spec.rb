require 'rails_helper'

describe MaterialsController do
    let(:test_material) { FactoryGirl.create(:material) }
    
    describe "GET #index" do
        context "when logged in" do
            login_user
            it "populates an array of materials"
            it "renders the :index view" do
                get :index
                expect(response).to render_template("index")
            end
            it "does not populate another users materials"
        end
        context "when not logged in" do
            it "does not get index" do
             get :index
                expect(response).to redirect_to(new_user_session_path)
            end
        end
    end
  
    describe "GET #show" do
        context "when logged in" do
            login_user
            it "assigns the requested material to @material"  do
                get :show, id: test_material
                expect(assigns(:material)).to eq(@material)
            end
            it "renders the :show template" 
            it "does not show another users material"
        end
        context "when not logged in" do
            it "does not render a :show template" do
                get :show, id: test_material.id
                expect(response).to redirect_to(new_user_session_path)
            end
        end
    end
  
    describe "GET #new" do
        context "when logged in" do
            login_user
            it "assigns a new Material to @material"
            it "renders the :new template"
        end
        
        context "when not logged in" do
            it "does not assign a new Material to @material" do
                #material = FactoryGirl.create(:material)
                get :new, id: test_material
                expect(response).to redirect_to(new_user_session_path)
            end
        end
    end
  
    describe "POST #create" do
        context "with valid attributes" do
            login_user
            it "saves the new material in the database" do
                expect{
                    post :create, material: FactoryGirl.attributes_for(:material)
                }.to change(Material,:count).by(1)
            end
            it "redirects to the new material" do
                post :create, material: FactoryGirl.attributes_for(:material)
                expect(response).to redirect_to Material.last
            end
        end    
        
        context "when not logged in" do
            it  "does not save the new material in the database" do
                get :create, id: test_material.id
                expect(response).to redirect_to(new_user_session_path)
            end
        end
        
        context "with invalid attributes" do
            login_user
            it "does not save the new material in the database" do
                expect{
                    post :create, material: FactoryGirl.attributes_for(:invalid_material)
                }.to_not change(Material,:count)
            end
            it "re-renders the :new template" do
                post :create, material: FactoryGirl.attributes_for(:invalid_material)
                expect(response).to render_template :new
            end
        end

    end
    
    describe "update a material" do
        context "when logged in" do
            it "should update a users material"
            it "should not update another users material"
        end
        context "when not logged in" do
            it "does not render a :show template" do
                get :update, id: test_material
                expect(response).to redirect_to(new_user_session_path)
            end
        end
    end
    
    describe "if a non-existent material is called" do
        it "should flash an error" 
    end
end