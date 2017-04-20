require 'data_manager'

RSpec.describe "Data Manager" do

  # Create a dummy class to emulate extending the module
  before(:each) do
    @class = Class.new { extend DataManager }
    @data_file = "db/#{@class.class.name.downcase}.txt"
  end

  it "should have a data directory" do
    expect(File.directory?("db")).to eq(true)
  end

  it "should have a file to write data to" do
    expect(File.file?(@data_file)).to eq(true)
  end

  it "should write data to a file" do
    @class.write_data("user data")
    contents = File.open(@data_file) { |f| f.readline }
    expect(contents).to include("user data")
  end

  pending "should append to existing data"

  pending "should read data from a file"

  after(:each) do
    File.delete(@data_file)
  end
end