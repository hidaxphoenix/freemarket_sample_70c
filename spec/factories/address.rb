FactoryBot.define do
  factory :address do
    postcode { "111-1111" }
    address_prefecture { 1 }
    address_city { "豊島区" }
    address_block { "三角町1-1-1" }
  end
end