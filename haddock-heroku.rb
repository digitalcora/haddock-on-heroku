require 'sinatra'
require 'haddock'

configure :production do
  require 'rack-ssl-enforcer'
  use Rack::SslEnforcer
end

set :views, settings.root

get '/' do
  @password = begin
    Haddock::Password.generate(16)
  rescue Haddock::Password::NoWordsError
    Haddock::Password.diction = '2of12.txt'
    retry
  end
  erb :index
end
