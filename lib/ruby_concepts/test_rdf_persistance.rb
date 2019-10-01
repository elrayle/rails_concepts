# Registers in-memory repositories. Other implementations of
# RDF::Repository support persistence to (e.g.) triplestores & NoSQL
# databases.
ActiveTriples::Repositories.add_repository :default, RDF::Repository.new
ActiveTriples::Repositories.add_repository :people, RDF::Repository.new

class Person < ActiveTriples::Resource
  configure :type => RDF::FOAF.Person, :base_uri => 'http://example.org/people#', :repository => :people
  property :name, :predicate => RDF::FOAF.name
end

class Thing < ActiveTriples::Resource
  configure :type => RDF::OWL.Thing, :base_uri => 'http://example.org/things#', :repository => :default
  property :title, :predicate => RDF::DC.title
  property :description, :predicate => RDF::DC.description
  property :creator, :predicate => RDF::DC.creator, :class_name => 'Person'
end

t = Thing.new('1')
t.title = 'A Thing'
t.creator = Person.new('1')
t.persisted? # => false
t.creator.first.name = 'Tove'
t.persist!

ActiveTriples::Repositories.repositories[:default].dump :ntriples
# => "<http://example.org/things#1> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .\n<http://example.org/things#1> <http://purl.org/dc/terms/title> \"A Thing\" .\n<http://example.org/things#1> <http://purl.org/dc/terms/creator> <http://example.org/people#1> .\n"

t.creator.first.persisted? # => false
t.creator.first.persist!

ActiveTriples::Repositories.repositories[:people].dump :ntriples
# => "<http://example.org/people#1> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://xmlns.com/foaf/0.1/Person> .\n<http://example.org/people#1> <http://xmlns.com/foaf/0.1/name> \"Tove\" .\n"



#######################################################################################################################



# Registers rdf/do sqlite3 repositories.
ActiveTriples::Repositories.add_repository :default, RDF::DataObjects::Repository.new(Rails.configuration.triplestore.repository)

class Person < ActiveTriples::Resource
  configure :type => RDF::FOAF.Person, :base_uri => 'http://example.org/people#', :repository => :default
  property :name, :predicate => RDF::FOAF.name
end

class Thing < ActiveTriples::Resource
  configure :type => RDF::OWL.Thing, :base_uri => 'http://example.org/things#', :repository => :default
  property :title, :predicate => RDF::DC.title
  property :description, :predicate => RDF::DC.description
  property :creator, :predicate => RDF::DC.creator, :class_name => 'Person'
end

t = Thing.new('1')
t.title = 'A Thing'
t.creator = Person.new('1')
t.persisted? # => false
t.creator.first.name = 'Tove'
t.persist!

ActiveTriples::Repositories.repositories[:default].dump :ntriples
# => "<http://example.org/things#1> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .\n<http://example.org/things#1> <http://purl.org/dc/terms/title> \"A Thing\" .\n<http://example.org/things#1> <http://purl.org/dc/terms/creator> <http://example.org/people#1> .\n"

t.creator.first.persisted? # => false
t.creator.first.persist!

ActiveTriples::Repositories.repositories[:default].dump :ntriples
# => "<http://example.org/things#1> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .\n<http://example.org/things#1> <http://purl.org/dc/terms/title> \"A Thing\" .\n<http://example.org/things#1> <http://purl.org/dc/terms/creator> <http://example.org/people#1> .\n"



#######################################################################################################################



# Registers rdf/do sqlite3 repositories.
ActiveTriples::Repositories.add_repository :default, RDF::DataObjects::Repository.new(Rails.configuration.triplestore.default_repository)
ActiveTriples::Repositories.add_repository :people,  RDF::DataObjects::Repository.new(Rails.configuration.triplestore.person_repository)

class Person < ActiveTriples::Resource
  configure :type => RDF::FOAF.Person, :base_uri => 'http://example.org/people#', :repository => :people
  property :name, :predicate => RDF::FOAF.name
end

class Thing < ActiveTriples::Resource
  configure :type => RDF::OWL.Thing, :base_uri => 'http://example.org/things#', :repository => :default
  property :title, :predicate => RDF::DC.title
  property :description, :predicate => RDF::DC.description
  property :creator, :predicate => RDF::DC.creator, :class_name => 'Person'
end

t = Thing.new('6')
t.title = 'Ugh'
t.title << 'Ugh 2'
t.creator = Person.new('6')
t.persisted? # => false
t.creator.first.name = 'Uga'
t.persist!

# ActiveTriples::Repositories.repositories[:default].dump :ntriples
# => "<http://example.org/things#1> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .\n<http://example.org/things#1> <http://purl.org/dc/terms/title> \"A Thing\" .\n<http://example.org/things#1> <http://purl.org/dc/terms/creator> <http://example.org/people#1> .\n"

t.creator.first.persisted? # => false
t.creator.first.persist!

# ActiveTriples::Repositories.repositories[:people].dump :ntriples
# => "<http://example.org/people#1> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://xmlns.com/foaf/0.1/Person> .\n<http://example.org/people#1> <http://xmlns.com/foaf/0.1/name> \"Tove\" .\n"


















"<http://example.org/things#1> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .\n<http://example.org/things#1> <http://purl.org/dc/terms/title> \"A Thing\" .\n<http://example.org/things#1> <http://purl.org/dc/terms/creator> <http://example.org/people#1> .\n"
"<http://example.org/things#1> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .\n<http://example.org/things#1> <http://purl.org/dc/terms/title> \"A Thing\" .\n<http://example.org/things#1> <http://purl.org/dc/terms/creator> <http://example.org/people#1> .\n"

"<http://example.org/things#1> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .\n<http://example.org/things#1> <http://purl.org/dc/terms/title> \"A Thing\" .\n<http://example.org/things#1> <http://purl.org/dc/terms/creator> <http://example.org/people#1> .\n"
"<http://example.org/things#1> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .\n<http://example.org/things#1> <http://purl.org/dc/terms/title> \"A Thing\" .\n<http://example.org/things#1> <http://purl.org/dc/terms/creator> <http://example.org/people#1> .\n"

"<http://example.org/people#1> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://xmlns.com/foaf/0.1/Person> .\n<http://example.org/people#1> <http://xmlns.com/foaf/0.1/name> \"Tove\" .\n<http://example.org/things#1> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .\n<http://example.org/things#1> <http://purl.org/dc/terms/title> \"A Thing\" .\n<http://example.org/things#1> <http://purl.org/dc/terms/creator> <http://example.org/people#1> .\n"
"<http://example.org/things#1> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .\n<http://example.org/things#1> <http://purl.org/dc/terms/title> \"A Thing\" .\n<http://example.org/things#1> <http://purl.org/dc/terms/creator> <http://example.org/people#1> .\n"




"<http://example.org/people#1> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://xmlns.com/foaf/0.1/Person> .\n<http://example.org/people#1> <http://xmlns.com/foaf/0.1/name> \"Tove\" .\n"
"<http://example.org/people#1> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://xmlns.com/foaf/0.1/Person> .\n<http://example.org/people#1> <http://xmlns.com/foaf/0.1/name> \"Tove\" .\n"

"<http://example.org/things#1> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .\n<http://example.org/things#1> <http://purl.org/dc/terms/title> \"A Thing\" .\n<http://example.org/things#1> <http://purl.org/dc/terms/creator> <http://example.org/people#1> .\n<http://example.org/people#1> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://xmlns.com/foaf/0.1/Person> .\n<http://example.org/people#1> <http://xmlns.com/foaf/0.1/name> \"Tove\" .\n"
"<http://example.org/things#1> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .\n<http://example.org/things#1> <http://purl.org/dc/terms/title> \"A Thing\" .\n<http://example.org/things#1> <http://purl.org/dc/terms/creator> <http://example.org/people#1> .\n"
