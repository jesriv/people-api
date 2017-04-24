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

  it "should order descending column then an ascending column" do
    data = [['b','smith'],['r','wells'],['g','madison'],['r','washington'],['r','randolph']]
    sorted = @class.order_by_columns(data, 0, 1)

    expect(sorted).to eq([['r','randolph'],['r','washington'],['r','wells'],['g','madison'],['b','smith']])
  end
end