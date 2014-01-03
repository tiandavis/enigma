require 'spec_helper'

describe Number do
  it "is valid with a value" do
    expect(build(:number, value: 8191)).to be_valid
  end
  
  it "is valid without a value" do
    expect(build(:number)).to be_valid
  end
  
  it "is valid when value is no longer than five characters" do
    expect(build(:number, value: -8192)).to be_valid
  end
  
  it "is invalid with a value longer than five characters" do
    expect(build(:number, value: 100000)).not_to be_valid
  end
  
  describe "encodes a signed integer" do
    context "return format" do
      it "returns a four character string" do
        expect(build(:number).encode(0).length).to eq(4)
      end
      
      it "returns a hex value" do
        expect(build(:number).encode(0)).to eq("4000")
      end
    end
    
    context "return values" do
      it "encodes integer 2048 to hex 5000" do
        expect(build(:number).encode(2048)).to eq("5000")
      end
      
      it "encodes integer 2048 to hex 5000" do
        expect(build(:number).encode(2048)).not_to eq("5001")
      end
    end
  end
  
  describe "decodes a hi byte and lo byte" do
    context "return format" do
      it "returns a signed integer" do
        expect(build(:number).decode("7F", "7F").to_i.is_a? Integer).to eq(true)
      end
    end
    
    context "return values" do
      it "decodes hex 5000 to integer 2048" do
        expect(build(:number).decode("50", "00")).to eq(2048)
      end
      
      it "decodes hex 5000 to integer 2048" do
        expect(build(:number).decode("50", "00")).not_to eq(2049)
      end
    end
  end
end