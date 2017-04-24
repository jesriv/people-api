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
end