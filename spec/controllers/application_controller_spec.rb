require 'rails_helper'

describe ApplicationController do
    
    describe "validate user admin state" do
        context "when an admin logs in" do
            login_admin    
            it "should consider a user with _admin boolean an admin" do
                expect(subject.current_user.admin).to eq(true)
                expect(subject.current_admin_user).to eq(subject.current_user)
            end
        end
        context "when a non-admin logs in" do
            login_user 
            it "should current_user admin should return false" do
                expect(subject.current_user.admin).to eq(false)
            end
            it "should set current_admin nil" do
                if subject.user_signed_in? && subject.current_user.admin == false
                    expect(subject.current_admin_user).to eq(nil)
                end
            end
        end
    end
end