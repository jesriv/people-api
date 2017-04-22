module Sorter
  def order_by_column(data, index)
    data.sort_by { |column| column[index]}
  end
end