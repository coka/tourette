require "sinatra"
require "json"

get "/" do
  erb :index
end

post "/" do
  content_type :json
  headers "Access-Control-Allow-Origin"  => "*"
  JSON "output" => `#{JSON.parse(request.body.read)["command"]}`
end
