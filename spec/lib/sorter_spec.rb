require 'sorter'

RSpec.describe "Sorter" do

  #
  # Create a dummy class that includes the module
  #
  class IncludeClass; include Sorter end

  before(:context) do
    @class = IncludeClass.new
    @data = [['a','b','c'], ['c','a','b'], ['b','c','a']]
  end

  it "should order rows by a column" do
    result = @class.order_by_column(@data, 1)
    expect(result).to eq([['c','a','b'], ['a','b','c'], ['b','c','a']])
  end

  it "should order descending by a column" do
    result = @class.order_by_column(@data, 1, 'DESC')
    expect(result).to eq([['b','c','a'], ['a','b','c'], ['c','a','b']])
  end
end