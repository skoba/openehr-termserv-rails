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
  codeset.xpath('code').each do |code|
    value = code.attribute('value').value
    description = code.attribute('description')&.value
    Code.create(value: value, description: description, codeset: cs)
  end
end

terms = Nokogiri::XML(File.read(File.join(Rails.root, 'db/openehr_terminology.xml')))
terms.xpath('//terminology').each do |terminology|
  name = terminology.attribute('name').value
  t = Terminology.create(name: name)
  terminology.xpath('group').each do |group|
    name = group.attribute('name').value
    g = Group.find_or_create_by name: name, terminology: t
    group.xpath('concept').each do |concept|
      id = concept.attribute('id').value
      rubric = concept.attribute('rubric').value
      Concept.create conceptid: id, rubric: rubric, group: g, terminology: t
    end
  end
end
