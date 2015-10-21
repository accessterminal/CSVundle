require 'csvundle/version'
require 'csvundle/access_csv'

module CSVundle
  def self.csv_for(type, collection)
    csv = CSVundle::AccessCSV.new(type.to_sym).portfolio_to_csv(collection)
  end
end
