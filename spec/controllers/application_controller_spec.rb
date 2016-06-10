require 'rails_helper'

describe ApplicationController do
    
    describe "check non admin" do
        login_user 
        it "should return as a non-admin" do
            expect(subject.current_user.admin).to eq(false)
        end

        it "should set current_admin nil if signed in not admin = true" do
            if subject.user_signed_in? && subject.current_user.admin == false
                expect(subject.current_admin_user).to eq(nil)
            end
        end
    end
    
    describe "check admin" do
        login_admin    
        it "should consider a user with _admin boolean an admin" do
            expect(subject.current_user.admin).to eq(true)
            expect(subject.current_admin_user).to eq(subject.current_user)
        end
        
    end
end