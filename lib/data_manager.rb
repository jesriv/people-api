module DataManager
	#
	# On extension of the module
	# check for existance of data directory and data file
	# and create if they do not exist
	#
	def self.extended(obj)
		@@data_dir = "db"
		@@data_file = "#{@@data_dir}/#{obj.class.name.downcase}.txt"

		make_data_dir
		make_data_file
	end

	def write_data(contents)
		File.open(@@data_file, 'a') { |f| f << "#{contents}\n" }
	end

	def read_data
		File.read(@@data_file)
	end

	private

	#
	# Check if the data directory exists
	# if not create one
	#
	def self.make_data_dir
		Dir.mkdir(@@data_dir) unless File.directory?(@@data_dir)
	end

	#
	# Check if the data file exists
	# if not create one named after the class that extended the module
	# 
	def self.make_data_file
		File.new(@@data_file, 'w') unless File.file?(@@data_file)
	end
end