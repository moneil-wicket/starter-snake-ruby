require 'rack'
require 'rack/contrib'
require 'sinatra'
require './app/util'
require './app/move'

use Rack::PostBodyContentTypeParser

get '/' do
  appearance = {
    apiversion: '1',
    author: 'moneil-wicket',
    color: '#F64A91',
    head: 'gamer',
    tail: 'mouse'
  }

  camelcase(appearance).to_json
end

post '/start' do
  request = underscore(env['rack.request.form_hash'])
  puts 'START'
  'OK\n'
end

post '/move' do
  request = underscore(env['rack.request.form_hash'])

  # Implement move logic in app/move.rb
  response = move(request)
  content_type :json
  camelcase(response).to_json
end

post '/end' do
  puts 'END'
  'OK\n'
end
