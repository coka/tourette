class CommandExecutor

  def self.parse_request_body(requestBody)
    JSON.parse(requestBody)
  end

  def self.run_command(command)
    `#{command}`
  end

  def self.construct_response(commandOutput)
    JSON.generate({ :output => commandOutput })
  end

  def self.execute(request)
    parsedRequest = parse_request_body(request.body.read)
    commandOutput = run_command(parsedRequest["command"])
    construct_response(commandOutput)
  end

end
