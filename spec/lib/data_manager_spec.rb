require 'data_manager'

RSpec.describe "Data Manager" do

  #
  # Create a dummy class that includes the module
  #
  class IncludeClass; include DataManager end

  
  context "included" do
    before(:context) do
      @class_instance = IncludeClass.new
    end

    it "should respond to write_data" do
      expect(@class_instance).to respond_to(:write_data)
    end
  end

  #
  # Tests for reading and writing to a data file
  #
  context "file management" do
    before(:each) do
      @class = IncludeClass.new


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

    it "should save attributes" do
      @class.instance_variable_set("@firstname", "Ted")
      @class.instance_variable_set("@address", "123 Maple Ave")
      @class.save
      contents = File.read(@data_file)
      expect(contents).to eq("Ted,123 Maple Ave\n")
    end

    #
    # Delete everything inside the file after each test
    #
    after(:each) do
      File.open(@data_file, 'w') { |f| f.truncate(0) }
    end

    #
    # Delete the data file after all tests in context
    #
    after(:each) do
      File.delete(@data_file) if @data_file
    end
  end
end