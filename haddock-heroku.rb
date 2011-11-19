require 'sinatra'
require 'haddock'

configure :production do
  require 'rack-ssl-enforcer'
  use Rack::SslEnforcer
end

get '/' do
  'It works!'
end
