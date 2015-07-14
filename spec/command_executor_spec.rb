require "command_executor"

describe CommandExecutor do

  describe ".execute" do

    context "given 'echo hello'" do
      
      it "returns 'hello'" do
        expect(described_class.execute("echo hello")).to eql("hello\n")
      end

    end

    context "given 'echo $((2 + 2))'" do

      it "returns '4'" do
        expect(described_class.execute("echo $((2 + 2))")).to eql("4\n")
      end

    end

  end

end
