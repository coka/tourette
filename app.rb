require "sinatra"
require "json"
require_relative "lib/command_executor.rb"

get "/" do
  erb :index
end

post "/" do
  content_type :json
  headers "Access-Control-Allow-Origin"  => "*"
  CommandExecutor.execute(request)
end
