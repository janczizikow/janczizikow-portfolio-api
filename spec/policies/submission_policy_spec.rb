# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SubmissionPolicy do
  let(:user) { build(:user) }

  subject { described_class }

  permissions '.scope' do
    pending "add some examples to (or delete) #{__FILE__}"
  end

  permissions :index? do
    include_examples 'users only'
  end

  permissions :show? do
    include_examples 'users only'
  end

  permissions :create? do
    it { expect(subject).to permit }
  end

  permissions :destroy? do
    include_examples 'users only'
  end
end
