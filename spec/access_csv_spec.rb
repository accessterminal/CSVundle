require 'spec_helper'

describe CSVundle::GenericCSV do
  context "Generic parent CSV class" do
    let(:csv) { CSVundle::GenericCSV.new }

    it "has rows & columns" do
      expect(csv.rows).to eq []
      expect(csv.columns).to eq []
    end

    it "can viperize (convert to snakecase) a given symbol" do
      expect(csv.viperize(:PrimaryKey)).to eq :primary_key
    end

    it "can normalize columns to ruby guidelines" do
      csv.columns = ["lien_ID", "AccessPants"]
      expect(csv.normalized_columns).to eq [:lien_id, :access_pants]
    end

    it "can get the rows for a given column" do
      csv.columns = ["heads", "toes", "friends", "foes", "number of jerry's"]
      csv.rows <<   [1, 6, 1, 99, "3.14159365358979323846264338327950288419"]
      csv.rows <<   [2, 4, 14, 3, "3.14159365358979323846264338327950288419"]
      expect(csv.rows_for("foes")).to eq({ foes: [99, 3] })
    end
  end

  context "AccessCSV Class" do
    let(:lienalytics_csv)       { CSVundle::AccessCSV.new(:lienalytics) }
    let(:lumentum_csv)        { CSVundle::AccessCSV.new(:lumentum) }
    let(:expected_lienalytics)  { YAML.load(File.read("config/headers.yml"))['lienalytics'] }
    let(:expected_lumentum)   { YAML.load(File.read("config/headers.yml"))['lumentum'] }

    it "has the proper headers for liencloud on instantiation" do
      expect(lienalytics_csv.columns).to eq expected_lienalytics
    end

    it "has the proper headers for lumentum on instantiation" do
      expect(lumentum_csv.columns).to eq expected_lumentum
    end

    it "can set up a given csv by type" do
      lienalytics_csv.portfolio_to_csv([2, 3, 4])
    end
  end
end
