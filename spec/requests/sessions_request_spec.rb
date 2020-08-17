require 'rails_helper'

RSpec.describe 'Sessions', type: :request do

  describe 'GET /new' do
    it 'returns http success for login' do
      get '/login'
      expect(response).to have_http_status(:success)
    end

    it 'returns http success for sign up' do
      get '/users/signup'
      expect(response).to have_http_status(:success)
    end
  end
end
