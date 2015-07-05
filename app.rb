require "sinatra"
require "json"

get "/" do
  erb :index
end

post "/" do
  JSON "output" => `#{JSON.parse(request.body.read)["command"]}`
end
