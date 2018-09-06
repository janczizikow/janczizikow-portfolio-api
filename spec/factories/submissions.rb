# frozen_string_literal: true

FactoryBot.define do
  factory :submission do
    sequence(:id) { |n| n }
    name { 'MyString' }
    sequence(:email) { |n| "foo#{n}@bar.com" }
    message { 'MyText' }
  end
end
