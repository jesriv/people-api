require 'parser'

RSpec.describe "Parser" do

  # Create a dummy class to emulate extending the module
  let(:extended_class) { Class.new { extend Parser } }

  it "should read a comma separated line" do
    result = extended_class.split_input("Smith, Joe, Blue, 1-15-1990")
    expect(result).to eq(["Smith", "Joe", "Blue", "1-15-1990"])
  end

  it "should read a pipe separated line" do
    result = extended_class.split_input("Smith | Joe | Blue | 1-15-1990")
    expect(result).to eq(["Smith", "Joe", "Blue", "1-15-1990"])
  end

  it "should strip leading whitespace of field" do
    result = extended_class.split_input(" Smith, Joe, Blue, 1-15-1990")
    expect(result).to eq(["Smith", "Joe", "Blue", "1-15-1990"])
  end

  it "should strip trailing whitespace of field" do
    result = extended_class.split_input(" Smith , Joe , Blue , 1-15-1990 ")
    expect(result).to eq(["Smith", "Joe", "Blue", "1-15-1990"])
  end

  it "should leave whitespace if field has two parts" do
    result = extended_class.split_input(" de Jesus , Juan , Green , 3-20-1980 ")
    expect(result).to eq(["de Jesus", "Juan", "Green", "3-20-1980"])
  end
end