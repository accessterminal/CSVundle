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
    CSV_FORMATS = {
      lienalytics: -> {
        YAML.load(File.read("config/headers.yml"))['lienalytics']
      },
      lumentum: -> {
        YAML.load(File.read("config/headers.yml"))['lumentum']
      }
    }.freeze

    def initialize(type)
      @columns = CSV_FORMATS.fetch(type).call
      @type = type
    end
    
    def test
      # Now, setup data is retrieved in the form of:
      # 
      #
      #setup_data = { "headers" => 
      #      ["lien_ID", "row_number", "state_name", "county_name", "full_fips_code",
      #      "apn", "parcel_id", "block", "lot", "qualifier", "addl_lots", "tax_type",
      #      "list_item_reference", "client_provided_parcel_id", "certificate_no",
      #      "face_value", "redemptive_value", "principal", "tax_year", "total_yearly_tax",
      #      "location_street_address_1", "location_street_address_2", "location_city_state_zip",
      #      "location_city", "location_zip", "longitude", "latitude", "county_land_use",
      #      "county_land_use_desc", "standardized_land_use", "standardized_land_use_desc",
      #      "county_held", "prop_record_year", "lien_rollup", "location_house_number",
      #      "location_street_dir_left", "location_street_name", "location_street_suffix",
      #      "location_street_dir_right", "location_unit_number", "legal_status", "interest_rate",
      #      "penalty_rate", "penalty_amount", "premium_overbid", "overbid_interest_rate",
      #      "original_sale_auction_date", "date_purchased_from_issuer", "issuer", "sub",
      #      "assessment_year", "assessed_land_value", "assessed_improvement_value",
      #      "total_assessed_value", "market_value_year", "market_land_value", "market_improvement_value",
      #      "total_market_value", "lot_frontage", "lot_depth", "lot_size_unit", "zoning",
      #      "building_class", "year_built", "no_of_stories", "no_of_units", "last_sale_date",
      #      "last_sale_price", "last_arms_length_sale_date", "last_arms_length_sale_price",
      #      "prior_arms_length_sale_date", "prior_arms_length_sale_price", "legal_city", "legal_block",
      #      "legal_lot_number", "legal_section", "legal_district", "legal_unit", "legal_subdivision_name",
      #      "legal_phase_number", "legal_tract_number", "legal_section_township_range_meridian",
      #      "legal_assessors_map_ref", "legal_brief_desc", "current_owner", "mailing_care_of",
      #      "mailing_street_address", "mailing_city_state", "mailing_zip", "owner_occupied",
      #      "loan1_contract_date", "loan1_recording_date", "loan1_amount", "loan1_due_date",
      #      "loan1_type", "loan2_contract_date", "loan2_recording_date", "loan2_amount", "loan2_due_date",
      #      "loan2_type", "municipality", "tags", "bids", "notes", "additional_csv_data"],
      #  "filler_row_count" => 1,
      #  "initial_data" => ["Lienalytics Custom List", "Downloaded on 2015-10-20"] }
      b = YAML.load(File.read("config/csv_setup_data.yml"))
      setup_data = b[options[:type.to_s]]
      require 'pry'; binding.pry 
      puts "a"
    end

    def portfolio_to_csv(collection)
      YAML.load(File.read("config/csv_setup_data.yml"))[@type.to_s]
    end
  end
end
