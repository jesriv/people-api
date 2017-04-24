require 'grape'
require './app/setup'

class API < Grape::API
  format :json

  resource :records do

    params do
      requires :record, type: String, 
        regexp: /\w+(\,|\s|\|)+\w+(\,|\s|\|)+\w+(\,|\s|\|)+[0-9]{1,2}\-[0-9]{1,2}\-[0-9]{4}$/,
        allow_blank: false
    end

    desc 'Create a new record'
    post do
      person = Person.bind_row(params.record)
      
      if person && person.save
        { status: "success", 
          record: [person.last_name, person.first_name, person.favorite_color, person.date_of_birth]
        }
      else
        { error: "Couldn't save the record"}
      end
    end

    desc 'Get records sorted by birthdate'
    get :birthdate do
      results = Person.order_by_column(Person.read_data, 3)
      { records: results }
    end

    desc 'Get records sorted by last name'
    get :name do
      results = Person.order_by_column(Person.read_data, 0, 'DESC')
      { records: results }
    end

    desc 'Get records sorted by color and last name'
    get :color do
      results = Person.order_by_columns(Person.read_data, 2, 0)
      { records: results }
    end
  end
end