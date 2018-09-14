# frozen_string_literal: true

desc 'Ping heroku to keep dyno alive'

task :dyno_ping do
  require 'net/http'

  if ENV['PING_URL']
    uri = URI(ENV['PING_URL'])
    Net::HTTP.get_response(uri)
  end
end
