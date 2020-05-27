require 'rack'

class App
  def call(env)
    http_status ='200'
    headers ={'Content-Type' => 'text/html'}
    body = ['hello word']

    [http_status, headers, body]
  end
end

Rack::Server.start(
  app:App.new
)