module Parser
  def split_input(fields)
    fields.split(/,|\|/).map { |field| field.strip }
  end
end