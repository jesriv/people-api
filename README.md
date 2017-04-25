# People API

Tools used:
- RSpec
- Sinatra
- Grape


#### Runnning Tests
All tests can be found in the spec directory and can be run by typing the `rspec` command in the root directory.

#### Running application
API is started by typing the `rackup` command. Site will be available on port 9292

#### Creating a new record
Send a JSON formatted POST request to the /records route with a record param including the string input.

Example: `{ record: "Lucas, Carl, Red, 6-1-1972" }`

NOTE: Date should be formatted *month-day-year*