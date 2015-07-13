require "command_executor"

describe CommandExecutor do

  describe ".run_command" do

    context "given 'echo hello'" do
      it "returns 'hello'" do
        expect(CommandExecutor.run_command("echo hello")).to eql("hello\n")
      end
    end

    context "given 'echo $((2 + 2))'" do
      it "returns '4'" do
        expect(CommandExecutor.run_command("echo $((2 + 2))")).to eql("4\n")
      end
    end

  end

  describe ".construct_response" do

    context "given an empty string" do
      it "returns the correct JSON string" do
        expect(CommandExecutor.construct_response("")).to eql("{\"output\":\"\"}")
      end
    end

    context "given a non-empty string" do
      it "returns the correct JSON string" do
        expect(CommandExecutor.construct_response("hello")).to eql("{\"output\":\"hello\"}")
      end
    end

  end

end
