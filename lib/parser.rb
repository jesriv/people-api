module Parser
  def split_input(fields)
    fields ? fields.split(/,|\|/).map { |field| field.strip } : false
  end
end