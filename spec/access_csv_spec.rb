require 'spec_helper'

describe CSVundle::GenericCSV do

  context "Generic parent CSV class" do
    let(:csv) { CSVundle::GenericCSV.new }

    it "has rows & columns" do
      expect(csv.rows).to eq []
      expect(csv.columns).to eq []
    end

    it "can normalize columns to ruby guidelines" do
      csv.columns = ["lien_ID", "AccessPants"]
      expect(csv.normalized_columns).to eq [:lien_id, :access_pants]
    end
  end

  context "AccessCSV Class" do
    let(:liencloud_csv)       { CSVundle::AccessCSV.new(:liencloud) }
    let(:lumentum_csv)        { CSVundle::AccessCSV.new(:lumentum) }
    let(:expected_liencloud)  { YAML.load(File.read("config/headers.yml"))['liencloud'] }
    let(:expected_lumentum)   { YAML.load(File.read("config/headers.yml"))['lumentum'] }

    it "has the proper headers for liencloud on instantiation" do
      expected_columns = YAML.load(File.read("config/headers.yml")).to_h['liencloud']
      expect(liencloud_csv.columns).to eq expected_liencloud 
    end

    it "has the proper headers for lumentum on instantiation" do
      expect(lumentum_csv.columns).to eq expected_lumentum
    end
  end
end
