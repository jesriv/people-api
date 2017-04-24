module DataManager

  #
  # Directory where data will get stored
  #
  DATA_DIR = "db"

  #
  # Extend the class methods when the module is included
  #
  def self.included(base)
    base.extend(ClassMethods)
  end

  def write_data(contents)
    File.open(self.class.data_file, 'a') { |f| f << "#{contents}\n" }
  end

  def save
    values.empty? ? false : write_data(values.join(","))
  end

  private

  def values
    instance_variables.map { |v| instance_variable_get(v) }
  end 

  #
  # Class methods for setting up data files
  #
  module ClassMethods
    def read_data
      file = File.read(data_file)
      file.split("\n").map { |line| line.split(",")}
    end

    def data_file
      "#{DATA_DIR}/#{self.name.downcase}.txt"
    end

    def create_data_file
      File.new(data_file, 'w') unless File.file?(data_file)
    end
  end
end