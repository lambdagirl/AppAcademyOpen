require 'rack'

# class App
#   def call(env)
#     http_status ='200'
#     headers ={'Content-Type' => 'text/html'}
#     body = ['hello word']

#     [http_status, headers, body]
#   end
# end

# Rack::Server.start(
#   app:App.new
# )

######basic Rack########
# Rack::Server.start(
#   app: Proc.new do |env|
#     ['200', {'Content-Type' => res'text/html'},['hello world']]
#   end
# )

app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  res['Content-Type'] = 'text/html'
  res.write(req.fullpath)
  res.finish
end

Rack::Server.start(
  app:app,
  Port: 3000
)