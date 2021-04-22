FactoryBot.define do
  factory :country_code, class: Code do
    value { "AF" }
    description { "AFGHANISTAN" }
    association :codeset, factory: :countries_codeset
  end
end
