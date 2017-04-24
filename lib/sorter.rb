module Sorter

  #
  # Orders an array by column
  # default order is ascending 
  # 
  def order_by_column(data, i, order='ASC')
    data.sort do |a, b| 
      order == 'DESC' ? b[i] <=> a[i] : a[i] <=> b[i]
    end
  end

  #
  # Orders an array by two columns
  # first column is descending and second is ascending
  # 
  def order_by_columns(data, *cols)
    data.sort do |a, b|
      [b[cols[0]], a[cols[1]]] <=> [a[cols[0]], b[cols[1]]]
    end
  end
end