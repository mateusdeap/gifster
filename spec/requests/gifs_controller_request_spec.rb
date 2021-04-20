require 'rails_helper'

RSpec.describe "GifsControllers", type: :request do
  include ActionDispatch::TestProcess
  
  fixtures :user

  context "as a guest user" do
    it "should not allow gif uploads" do
      post "/gifs", params: { gif: { image: fixture_file_upload("gif_2.gif", "image/gif") } }

      expect(response.status).to be 302
    end

    it "should allow user to see all gifs" do
      get "/gifs"

      expect(response.status).to be 200
    end
  end

  context "as a signed in user" do
    it "should allow gif uploads" do
      sign_in user(:bob)
      request = post "/gifs", params: { gif: { image: fixture_file_upload("gif_2.gif", "image/gif") } }

      expect(request).to redirect_to action: :index
    end
  end
end
