FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"aaa@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    encrypted_password    {"0000000"}
    first_name            {"一平"}
    last_name             {"山田"}
    first_name_kana       {"いっぺい"}
    last_name_kana        {"やまだ"}
    phone                 {"09000000000"}
    birthday              {"19900101"}
  end

end