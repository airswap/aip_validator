require 'spec_helper'

RSpec.describe "AipValidator::Validator"  do
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
  subject(:validator){ AipValidator::Validator.new(aip)}

  describe "valid" do
    it "should have required fields" do
      expect(validator.valid?).to eq true
    end
  end

  describe "missing fields" do
    it "raise error if required fields are missing" do
      expect(AipValidator::Validator.new().valid?).to eq false
    end
  end

  describe "wrong status" do
    let(:status) { 'Foo'}
    it "raise error if required fields are missing" do
      expect(validator.valid?).to eq false
      expect(validator.errors[:status].first).to eq 'is not included in the list'
    end
  end

  describe "attribute with -" do
    it "is valid if specified" do
      AipValidator::Validator.new(aip.merge({'discussions-to':'something'}))
    end

    it "not valid if not specified" do
      expect{
        AipValidator::Validator.new(aip.merge({'how-to':'something'}))
      }.to raise_error(/unknown attribute/)
    end
  end

  describe "attribute with _" do
    it "not valid" do
      expect{
        AipValidator::Validator.new(aip.merge({'discussions_to':'something'}))
      }.to raise_error("discussions_to incude _ which is not allowed")
    end
  end
end
