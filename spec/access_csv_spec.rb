require 'spec_helper'

describe CSVundle::AccessCSV do
  context "Generic parent CSV class" do
    let(:csv) { CSVundle::AccessCSV.new(:lienalytics) }

    it "has rows & columns" do
      expect(csv.columns.sort).to eq csv.setup_data['headers'].sort
      expect(csv.rows).to eq [[]] # lienalytics has a filler row
    end

    it "can viperize (convert to snakecase) a given symbol" do
      expect(csv.viperize(:PrimaryKey)).to eq :primary_key
    end

    it "can normalize columns to ruby guidelines" do
      csv.columns = ["lien_ID", "AccessPants"]
      expect(csv.normalized_columns).to eq [:lien_id, :access_pants]
    end
  end

  context "Access CSV generation" do
    let(:access_csv) { CSVundle::AccessCSV.new(:lienalytics) }

    it "does a thing" do
      mapped_data = []
      final_csv = access_csv.serve([[1],[2],[3],[4]])
      downloaded_date = Date.today
      expect(final_csv).to eq "Lienalytics Custom List Downloaded On #{downloaded_date}\n\nlien_ID,row_number,state_name,county_name,full_fips_code,apn,parcel_id,block,lot,qualifier,addl_lots,tax_type,list_item_reference,client_provided_parcel_id,certificate_no,face_value,redemptive_value,principal,tax_year,total_yearly_tax,location_street_address_1,location_street_address_2,location_city_state_zip,location_city,location_zip,longitude,latitude,county_land_use,county_land_use_desc,standardized_land_use,standardized_land_use_desc,county_held,prop_record_year,lien_rollup,location_house_number,location_street_dir_left,location_street_name,location_street_suffix,location_street_dir_right,location_unit_number,legal_status,interest_rate,penalty_rate,penalty_amount,premium_overbid,overbid_interest_rate,original_sale_auction_date,date_purchased_from_issuer,issuer,sub,assessment_year,assessed_land_value,assessed_improvement_value,total_assessed_value,market_value_year,market_land_value,market_improvement_value,total_market_value,lot_frontage,lot_depth,lot_size_unit,zoning,building_class,year_built,no_of_stories,no_of_units,last_sale_date,last_sale_price,last_arms_length_sale_date,last_arms_length_sale_price,prior_arms_length_sale_date,prior_arms_length_sale_price,legal_city,legal_block,legal_lot_number,legal_section,legal_district,legal_unit,legal_subdivision_name,legal_phase_number,legal_tract_number,legal_section_township_range_meridian,legal_assessors_map_ref,legal_brief_desc,current_owner,mailing_care_of,mailing_street_address,mailing_city_state,mailing_zip,owner_occupied,loan1_contract_date,loan1_recording_date,loan1_amount,loan1_due_date,loan1_type,loan2_contract_date,loan2_recording_date,loan2_amount,loan2_due_date,loan2_type,municipality,tags,bids,notes,additional_csv_data\n"
    end
  end
end
