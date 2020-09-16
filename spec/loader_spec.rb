require 'spec_helper'
require 'json'

RSpec.describe "AipValidator::Loader"  do
  let(:status) { 'Implemented' }
  let(:aip){
    {
      "aip" => 1,
      "title" => 'An Improvement',
      "author" => 'Alice, Bob, Carol',
      "status" => status,
      "created" => Date.parse('2017-10-10'),
      "discussions-to": "https://chat.airswap.io/"
    }
  }
  let(:file_name) {
   'spec/fixtures/valid/aip-1.md'
  }

  subject(:loader){ AipValidator::Loader.load(file_name)}

  describe "valid" do
    it "should have required fields" do
      expect(JSON.dump loader).to eq(JSON.dump aip)
    end
  end
end
