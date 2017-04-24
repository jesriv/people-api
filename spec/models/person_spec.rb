require 'person'

RSpec.describe "Person" do
  context "attributes" do
    before(:context) do
      @person = Person.new
    end

    it "should include Last Name" do
      expect(@person).to respond_to(:last_name)
    end

    it "should include First Name" do
      expect(@person).to respond_to(:first_name)
    end

    it "should include Favorite Color" do
      expect(@person).to respond_to(:favorite_color)
    end

    it "should include Date of Birth" do
      expect(@person).to respond_to(:date_of_birth)
    end
  end

  context "input string" do
    before(:context) do
      @person = Person.bind_row("Smith, Joe, Blue, 1-15-1990")
    end

    it "should match last name attribute to string input" do
      expect(@person.last_name).to eq("Smith")
    end

    it "should match first name attribute to string input" do
      expect(@person.first_name).to eq("Joe")
    end

    it "should match favorite color attribute to string input" do
      expect(@person.favorite_color).to eq("Blue")
    end

    it "should match date of birth to formatted date of birth" do
      expect(@person.date_of_birth).to eq(Date.strptime("1-15-1990", '%m-%d-%Y'))
    end
  end
end