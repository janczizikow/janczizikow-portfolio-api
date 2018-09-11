# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    sequence(:id) { |n| n }
    name { 'MyString' }
    date { '2018-09-11' }
    # sequence(:slug) { |n| "mystring#{n}" }
    slug { 'mystring' }
    category { 'MyString' }
    description { 'MyText' }
    links [{text: 'MyText', url: 'https://www.github.com'}]
  end
end
