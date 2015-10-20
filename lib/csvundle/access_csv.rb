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
      @columns.map { |c| viperize(c) }
    end
  end

  class AccessCSV < GenericCSV
    def initialize(type)
      case type
      when :liencloud
        @columns = YAML.load(File.read("config/headers.yml"))['liencloud']
      when :lumentum
        @columns = YAML.load(File.read("config/headers.yml"))['lumentum']
      end
    end
  end
end
