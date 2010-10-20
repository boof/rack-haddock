require 'rubygems'
require 'bundler/setup'
require 'haddock'
require 'rack'

class App
  include Haddock

  PATH_INFO = 'PATH_INFO'
  RX_SIZE   = %r'/(\d{1,2})'
  HEADER    = {'Content-Type' => 'text/plain'}

  def call(env)
    size = env[PATH_INFO][RX_SIZE, 1]
    [200, HEADER, [Password.generate(size ? size.to_i : 10)]]
  rescue
    [400, HEADER, ['']]
  end

end

run App.new
