require 'spec_helper'

describe ApplicationController do

  describe "GET #index" do
    it "populates an array of attendees" do
      attendees = FactoryGirl.create(:sitting)
      get :index
      assigns(:attendees).should eq [attendees]
    end

    it "renders the index view" do
      get :index
      response.should render_template :index
    end
  end

end
