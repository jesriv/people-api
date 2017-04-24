require 'api'

RSpec.describe 'The people API', type: :request do
  include Rack::Test::Methods

  def app
    API
  end

  context "POST /records request" do
    it "should create a person from a comma separated string and display json success" do
      post '/records', { record: "Smith, Joe, Purple, 12-19-2000" }
      expect(last_response.content_type).to eq("application/json")
      expect(last_response.body).to eq({status: "success", record: [
          "Smith", "Joe", "Purple", "12-19-2000"
        ]}.to_json
      )
    end

    it "should create a person from a pipe separated string and display json success" do
      post '/records', { record: "Smith | Joe | Purple | 12-19-2000" }
      expect(last_response.content_type).to eq("application/json")
      expect(last_response.body).to include('success')
    end

    it "should display error if record isn't created" do
      post '/records'
      expect(last_response.content_type).to eq("application/json")
      expect(last_response.body).to include('error')
    end
  end

  context "GET /records/birthdate request" do
    it "should return records sorted by birthdate" do
      post '/records', { record: "Smith, John, Green, 1-20-1990" }
      post '/records', { record: "Smith, Fred, Red, 2-5-1980" }

      get '/records/birthdate'
      expect(last_response.content_type).to eq("application/json")
      expect(last_response.body).to eq({records: [
          ["Smith", "John", "Green","1-20-1990"],
          ["Smith", "Fred", "Red", "2-5-1980"]
        ]}.to_json
      )
    end
  end

  context "GET /records/name request" do
    it "should return records sorted by descending last name" do
      post '/records', { record: "Allen, John, Green, 1-20-1990" }
      post '/records', { record: "Smith, Fred, Red, 2-5-1980" }

      get '/records/name'
      expect(last_response.content_type).to eq("application/json")
      expect(last_response.body).to eq({records: [
          ["Smith", "Fred", "Red", "2-5-1980"],
          ["Allen", "John", "Green","1-20-1990"]
        ]}.to_json
      )
    end
  end

  #
  # Delete everything inside the file after each test
  #
  after(:each) do
    File.open(Person.data_file, 'w') { |f| f.truncate(0) }
  end
end