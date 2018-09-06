# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Submission, type: :model do
  let(:submission) { build(:submission) }

  it 'has a valid factory' do
    expect(submission).to be_valid
  end

  it 'requires a name' do
    expect(build(:submission, name: '')).not_to be_valid
  end

  it 'requires a message' do
    expect(build(:submission, message: '')).not_to be_valid
  end

  it 'requires an email' do
    expect(build(:submission, email: '')).not_to be_valid
  end

  it 'requires a valid email' do
    expect(build(:submission, email: 'joe@shmoe')).not_to be_valid
  end
end
