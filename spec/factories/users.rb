# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:id) { |n| n }
    sequence(:email) { |n| "foo#{n}@bar.com" }
    password { 'secret' }
  end
end
