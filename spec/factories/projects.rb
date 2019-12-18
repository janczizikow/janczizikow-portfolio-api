# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    sequence(:id) { |n| n }
    sequence(:name) { |n| "MyString#{n}" }
    date { '2018-09-11' }
    sequence(:slug) { |n| "mystring#{n}" }
    category { 'MyString' }
    description { 'MyText' }
    links { [{text: 'MyText', url: 'https://www.github.com'}] }
  end
end
