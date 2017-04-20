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
    contents = File.read(@data_file)
    expect(contents).to include("user data")
  end

  it "should append to existing data" do
    @class.write_data("user line 1")
    @class.write_data("user line 2")
    contents = File.read(@data_file)
    expect(contents).to include("user line 1\nuser line 2\n")
  end

  it "should read data from a file" do
    @class.write_data("some data")
    contents = @class.read_data
    expect(contents).to include("some data")
  end

  after(:each) do
    File.delete(@data_file)
  end
end