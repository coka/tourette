class CommandExecutor

  def self.execute(command)
    `#{command}`
  end

end
