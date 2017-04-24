require 'web'

RSpec.describe 'The web app' do
  include Rack::Test::Methods

  def app
    Web
  end

  it "has a root page" do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to eq('People API')
  end
end