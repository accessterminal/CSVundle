require 'csv'
require 'yaml'

module CSVundle
  class GenericCSV
    attr_accessor :rows, :columns

    def initialize
      @rows, @columns = [], []
    end

    def viperize(symbol)
      word = symbol.to_s.dup
      word.gsub!(/::/, '/')
      word.gsub!(/([A-Z]+)([A-Z][a-z])/,'\1_\2')
      word.gsub!(/([a-z\d])([A-Z])/,'\1_\2')
      word.tr!("-", "_")
      word.downcase!
      word.to_sym
    end

    def normalized_columns
      columns.map { |c| viperize(c) }
    end

    def rows_for(column)
      { "#{column}": @rows.map { |row| row[@columns.index(column)] } }
    end
  end

  class AccessCSV < GenericCSV
    attr_reader :setup_data
    def initialize(type)
      @setup_data = YAML.load(File.read("config/csv_setup_data.yml")).fetch(type.to_s)
      @columns = @setup_data['headers']
      @type = type if type_usable? type
    end
    
    def type_usable?(type)
      [:lienalytics, :grant_street, :lumentum, :mtag, :old_lienalytics,
       :real_auction, :tsr, :tsr_js].include? type.to_sym
    end
  end
end
