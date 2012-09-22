require 'spec_helper'

describe MapController do

  describe "GET 'gmaps'" do
    it "returns http success" do
      get 'gmaps'
      response.should be_success
    end
  end

end
