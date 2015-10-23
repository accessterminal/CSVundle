require 'csvundle/version'
require 'csvundle/access_csv'

module CSVundle
  def self.setup_data_for(type)
    setup_data = CSVundle::AccessCSV.new(type.to_sym).setup_data
    Hash[setup_data.map{|(k,v)| [k.to_sym,v]}] # convert string keys to symbols
  end
end
