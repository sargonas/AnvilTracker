require 'rails_helper'

describe ApplicationHelper, type: :helper do
   it "generates sortable links" do
       allow(helper).to receive(:params).and_return({controller: 'filaments', action: 'index'})
       helper.sortable("filaments") 
   end
end