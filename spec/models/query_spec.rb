require 'rails_helper'

RSpec.describe Query do
  let(:query) { build(:query) }

  describe 'validations' do
    context 'when query is blank' do
      it 'is invalid' do
        query.query = ''
        expect(query).not_to be_valid
      end
    end
  end
end
