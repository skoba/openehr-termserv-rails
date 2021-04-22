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

require 'csv'
#japanese = Language.where code: 'ja'
disease_names = Terminology.new(name: 'shoubyou')
mhlw = Issuer.new(name: 'MHLW')
disease_set = Codeset.create(issuer: mhlw, openehrid: 'shobyomei master', externalid: 'shoubyoumei master')

CSV.foreach(Rails.root.join('db','b_20210101.txt'), encoding: 'Shift_JIS') do |row|
  Code.create(value: row[2], description: row[5].encode(Encoding::UTF_8), codeset: disease_set)
  Code.create(value: row[2], description: row[9].encode(Encoding::UTF_8), codeset: disease_set)
  Code.create(value: row[2], description: row[13].encode(Encoding::UTF_8), codeset: disease_set)
end


drug_set = Codeset.create(issuer: mhlw, openehrid: 'Receden master', externalid: 'Receden master')
CSV.foreach(Rails.root.join('db', 'y.csv'), encoding: 'Shift_JIS') do |row|
  Code.create(value: row[2], description: row[4].encode(Encoding::UTF_8), codeset: drug_set)
end
