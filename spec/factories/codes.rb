FactoryBot.define do
  factory :country_code, class: Code do
    value { FFaker::Address.country_code }
    description { FFaker::Address.country }
    association :codeset, factory: :countries_codeset
  end
end
