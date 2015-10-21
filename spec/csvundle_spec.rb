require 'spec_helper'

describe CSVundle do
  it 'has a version number' do
    expect(CSVundle::VERSION).not_to be nil
  end

  it 'can make a csv' do
    collection = [
       { "id"=>12,
         "property_id"=>12,
         "fund_id"=>nil,
         "certificate_no"=>"76-6432937",
         "legal_status"=>nil,
         "penalty_rate"=> 1.44259094250942,
         "penalty_amount"=>nil,
         "premium_overbid"=>nil,
         "overbid_interest_rate"=>nil,
         "tax_year"=>2014,
         "original_sale_auction_date"=>nil,
         "date_purchased_from_issuer"=> "Mon, 22 Jul 2013 00:00:00 UTC +00:00",
         "issuer"=>nil,
         "face_value"=> 3.24095404920495,
         "interest_rate"=> 31.4250942094209,
         "sub"=>nil,
         "county_held"=>nil,
         "created_at"=> "Tue, 20 Oct 2015 17:50:07 UTC +00:00",
         "updated_at"=> "Tue, 20 Oct 2015 17:50:07 UTC +00:00",
         "status"=>0,
         "tsr_ltv"=>nil,
         "lienalytics_ltv"=>nil,
         "stage"=>0,
         "principal"=>nil,
         "list_item_reference"=>nil,
         "tax_type"=>nil,
         "redemptive_value"=>nil } ]
    expect(CSVundle.csv_for(:lienalytics, collection)).to_not be_nil
    expect(CSVundle.csv_for(:lumentum, collection)).to_not be_nil
  end
end
