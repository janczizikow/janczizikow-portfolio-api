# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    name { 'MyString' }
    date { '2018-09-11' }
    slug { 'MyString' }
    category { 'MyString' }
    description { 'MyText' }
    links [{text: 'MyText', url: 'https://www.github.com'}]
  end
end
