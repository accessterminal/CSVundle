require 'csvundle/version'
require 'csvundle/access_csv'

module CSVundle
  def self.setup_data_for(type)
    CSVundle::AccessCSV.new(type.to_sym).csv.setup_data
  end
end
