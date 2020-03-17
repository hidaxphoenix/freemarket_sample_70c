FactoryBot.define do

  factory :item do
    # image               { Rack::Test::UploadedFile.new(File.join(Rails.root, 'test/fixtures/default.jpg')) }
    name               {"あああ"}
    description        {"あああああ"}
    category_id        {"2"}
    condition          {"2"}
    price              {"5000"}
    ship_charge        {"1"}
    ship_area          {"1"}
    ship_date          {"1"}
    ship_method        {"未定"}
    user
  end

end