class Person
  extend Parser
  include DataManager

  attr_accessor :last_name, :first_name, :favorite_color, :date_of_birth

  def initialize(params = {})
    @last_name 		= params.fetch(:last_name, '')
    @first_name 	= params.fetch(:first_name, '')
    @favorite_color = params.fetch(:favorite_color, '')
    @date_of_birth 	= params.fetch(:date_of_birth, '')
  end

  def self.bind_row(string)
    fields = self.split_input(string)
    Person.new(last_name: fields[0], first_name: fields[1], favorite_color: fields[2], date_of_birth: fields[3])
  end
end