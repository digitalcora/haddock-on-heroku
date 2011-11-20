require 'sinatra'
require 'haddock'

Haddock::Password.diction = 'words.txt'

configure :production do
  require 'rack-ssl-enforcer'
  use Rack::SslEnforcer
end

set :views, settings.root

get '/' do
  @password = Haddock::Password.generate(16)
  erb :index
end
