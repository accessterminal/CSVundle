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
      { "#{column}".to_sym => rows.map { |row| row[columns.index(column)] } }
    end
  end

  class AccessCSV < GenericCSV
    CSV_FORMATS = {
      liencloud: -> {
        YAML.load(File.read("config/headers.yml"))['liencloud']
      },
      lumentum: -> {
        YAML.load(File.read("config/headers.yml"))['lumentum']
      }
    }.freeze

    def initialize(type)
      @columns = CSV_FORMATS[type].call
    end
  end
end
