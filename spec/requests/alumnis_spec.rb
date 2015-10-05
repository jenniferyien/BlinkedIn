require 'rails_helper'

RSpec.describe "Alumnis", type: :request do
  describe "GET /alumnis" do
    it "works! (now write some real specs)" do
      get alumnis_path
      expect(response).to have_http_status(200)
    end
  end
end
