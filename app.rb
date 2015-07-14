require "sinatra"
require "json"
require_relative "lib/command_executor.rb"

get "/" do
  erb :index
end

post "/" do
  content_type :json
  headers "Access-Control-Allow-Origin"  => "*"
  begin
    parsedRequest = JSON.parse(request.body.read)
  rescue
    return status 400
  end
  commandOutput = CommandExecutor.execute(parsedRequest["command"])
  JSON.generate({ :output => commandOutput })
end
