# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ext = Nokogiri.XML(File.read(File.join(Rails.root, 'db/openehr_external_terminologies.xml')))
ext.xpath('//codeset').each do |codeset|
  issuer = Issuer.find_or_create_by name: codeset.attribute('issuer').value
  openehrid = codeset.attribute('openehr_id').value
  externalid = codeset.attribute('external_id').value
  cs = Codeset.create(issuer: issuer,
                 openehrid: openehrid,
                 externalid: externalid)
  codeset.xpath('//code').each do |code|
    value = code.attribute('value').value
    description = code.attribute('description')&.value
    Code.create(value: value, description: description, codeset: cs)
  end
end
