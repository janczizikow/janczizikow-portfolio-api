# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProjectPolicy do
  let(:user) { build(:user) }
  let(:projects) { 5.times  { build(:projects) } }
  let(:policy_scope) { ProjectPolicy::Scope.new(nil, Project).resolve }

  subject { described_class }

  permissions '.scope' do
    it 'shows all the projects' do
      expect(policy_scope).to eq Project.all
    end
  end

  permissions :show? do
    it { expect(subject).to permit }
  end

  permissions :create? do
    include_examples 'users only'
  end

  permissions :update? do
    include_examples 'users only'
  end

  permissions :destroy? do
    include_examples 'users only'
  end
end
