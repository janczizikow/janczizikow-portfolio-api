# frozen_string_literal:true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:params) { {email: 'asdasd', password: '1234567'} }

  context 'when params are invalid' do
    it 'fails validations' do
      expect(User.new(params).valid?).to be_falsey
    end
  end
end
