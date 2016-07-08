FactoryGirl.define do
  factory :countries_codeset, class: Codeset do
    issuer "ISO"
    openehrid "countries"
    externalid "ISO_3166-1"
  end
end
