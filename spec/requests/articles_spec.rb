require 'rails_helper'

RSpec.describe '/articles' do
  let(:article) { create(:article) }

  describe 'GET /index' do
    it 'renders a successful response' do
      get articles_url
      expect(response).to be_successful
    end
  end
end
