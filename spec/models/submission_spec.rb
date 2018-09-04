# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Submission, type: :model do
  it 'has a valid factory' do
    build(:submission).should be_valid
  end

  it 'requires a name' do
    build(:submission, name: '').should_not be_valid
  end

  it 'requires a message' do
    build(:submission, message: '').should_not be_valid
  end

  it 'requires an email' do
    build(:submission, email: '').should_not be_valid
  end

  it 'requires a valid email' do
    build(:submission, email: 'asd@asd').should_not be_valid
  end
end
