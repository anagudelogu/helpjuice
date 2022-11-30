require 'rails_helper'

RSpec.describe 'Users' do
  describe 'POST /create' do
    it 'returns http success' do
      post users_path, params: attributes_for(:user)
      expect(response).to have_http_status(:success)
    end
  end
end
