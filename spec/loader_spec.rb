require 'spec_helper'

RSpec.describe "AipValidator::Loader"  do
  let(:status) { 'Implemented' }
  let(:aip){
    {
      "aip" => 1,
      "title" => 'An Improvement',
      "author" => 'Alice, Bob, Carol',
      "status" => status,
      "created" => Date.parse('2017-10-10')
    }
  }
  let(:file_name) {
   'spec/fixtures/valid/aip-1.md'
  }

  subject(:loader){ AipValidator::Loader.load(file_name)}

  describe "valid" do
    it "should have required fields" do
      expect(loader).to eq(aip)
    end
  end
end
