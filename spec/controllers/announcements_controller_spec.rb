require 'spec_helper'

describe AnnouncementsController do

  before :all do
    @announcement = FactoryGirl.create(:announcement)
  end

  describe "GET #edit" do
    it "renders the edit announcement view" do
      get :edit, {:id => @announcement}
      expect(response).to render_template :edit
    end
  end

  describe "PUT #update" do
    it "updates the announcement content" do
      new_content = "New announcement content."
      put :update, {:id => @announcement, :announcement => {:content => new_content}}
      @announcement.reload
      expect(@announcement.content).to eq new_content
    end
  end

end