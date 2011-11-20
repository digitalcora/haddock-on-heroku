require 'sinatra'
require 'haddock'

Haddock::Password.diction = 'words.txt'

configure :production do
  require 'rack-ssl-enforcer'
  use Rack::SslEnforcer
end

helpers do
  include Rack::Utils
  alias_method :h, :escape_html
end

set :views, settings.root

get '/' do
  @length = params[:length].to_i
  @length = 16 if @length <= 0
  @length = 8 if @length < 8
  @length = 31 if @length > 31
  @passwords = []
  10.times{ @passwords << Haddock::Password.generate(@length) }
  erb :index
end
