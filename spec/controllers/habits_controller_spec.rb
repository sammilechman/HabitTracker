require 'rails_helper'

RSpec.describe HabitsController, type: :controller do
  include Devise::TestHelpers

  before :each do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
end
