module DataManager

  #
  # Directory where data will get stored
  #
  DATA_DIR = "db"

  #
  # On initialize
  # check for existance of data directory and data file
  # and create if they do not exist
  #
  def initialize
    @data_file = "#{DATA_DIR}/#{self.class.name.downcase}.txt"

    make_data_dir
    make_data_file(@data_file)
  end

  def write_data(contents)
    File.open(@data_file, 'a') { |f| f << "#{contents}\n" }
  end

  def read_data
    File.read(@data_file)
  end

  def save
    values = filtered_variables.map { |v| instance_variable_get(v) }
    write_data(values.join(","))
  end

  private
  #
  # Check if the data directory exists
  # if not create one
  #
  def make_data_dir
    Dir.mkdir(DATA_DIR) unless File.directory?(DATA_DIR)
  end

  #
  # Check if the data file exists
  # if not create one named after the class that included the module
  # 
  def make_data_file(file)
    File.new(file, 'w') unless File.file?(file)
  end

  #
  # Filter out the variables that shouldn't get saved to the data file
  # 
  def filtered_variables
    instance_variables.select { |v| instance_variable_get(v) != @data_file }
  end
end