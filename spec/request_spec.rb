require "spec_helper"
require_relative "../app"

describe "tourette" do

  let(:example_json_request) {
    JSON.generate({ :command => "echo hello" })
  }

  let(:example_json_reponse) {
    JSON.generate({ :output => "hello\n" })
  }

  let(:example_invalid_request) {
    "echo hello"
  }

  describe "POST /" do

    context "valid JSON request" do

      before do
        post "/", example_json_request
      end

      it "responds with 200 OK" do
        expect(last_response.status).to eql(200)
      end

      it "returns the correct response" do
        expect(last_response.body).to eql(example_json_reponse)
      end

    end

    context "invalid request" do

      before do
        post "/", example_invalid_request
      end

      it "responds with 400 Bad Request" do
        expect(last_response.status).to eql(400)
      end

    end

  end

end
