require 'date'
require 'csv'
require 'yaml'

module CSVundle
  class AccessCSV
    attr_accessor :setup_data, :rows, :columns, :full_csv
    attr_reader :headers, :column_values

    def initialize(type)
      @setup_data = YAML.load(ERB.new(File.read("#{GEM_ROOT}/config/csv_setup_data.yml")).result).fetch(type.to_s)
      @rows, @columns, @full_csv = [], [], []
      @headers = @setup_data['headers']
      @columns = @headers.keys
      @column_values = @headers.values
      @normalized_columns = normalized_columns
      @type = type if type_usable? type
      setup_by_type
    end

    def serve(mapped_data)
      mapped_data.each { |row| @rows << row }
      mapped_data.each { |row| @full_csv << row }
      CSV.generate { |csv| @full_csv.each { |row| csv << row } }
    end

    def setup_by_type
      full_csv << @setup_data['initial_data'] if @setup_data['initial_data'].any?
      @setup_data['filler_row_count'].times { full_csv << [] }
      @setup_data['filler_row_count'].times { rows << [] }
      full_csv << columns
    end

    def type_usable?(type)
      [:lienalytics, :grant_street, :lumentum, :mtag, :old_lienalytics,
       :real_auction, :tsr, :tsr_js].include? type.to_sym
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
end
