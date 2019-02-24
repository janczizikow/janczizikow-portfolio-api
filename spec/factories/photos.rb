# frozen_string_literal: true

FactoryBot.define do
  factory :photo do
    sequence(:id) { |n| n }
    photo { 'MyString' }
    # project nil
  end
end
