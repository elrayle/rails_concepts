ActiveTriples::Repositories.add_repository :default, RDF::DataObjects::Repository.new("sqlite3:db/triples.sqlite")
ActiveTriples::Repositories.add_repository :people, RDF::DataObjects::Repository.new("sqlite3:db/people.sqlite")
ActiveTriples::Repositories.add_repository :inmem_default, RDF::Repository.new
ActiveTriples::Repositories.add_repository :inmem_people, RDF::Repository.new



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

t = Thing.new('202')
t.title = 'A Thing of Crap'
t.persisted? # => false
t.persist!


t = Thing.new('102')
t.title = 'A Thing by Cow'
t.creator = Person.new('102')
t.persisted? # => false
t.creator.first.name = 'Cow'
t.persist!

ActiveTriples::Repositories.repositories[:default].dump :ntriples
# => "<http://example.org/things#1> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .\n<http://example.org/things#1> <http://purl.org/dc/terms/title> \"A Thing\" .\n<http://example.org/things#1> <http://purl.org/dc/terms/creator> <http://example.org/people#1> .\n"

t.creator.first.persisted? # => false
t.creator.first.persist!

ActiveTriples::Repositories.repositories[:people].dump :ntriples






vc = RDFTypes::VirtualCollectionRDF.create(id:          "123",
                                           title:       "Test Title",
                                           description: "Test description of virtual collection.",
                                           owner:       RDFTypes::PersonRDF.new("http://vivo.cornell.edu/individual/JohnSmith"))
vci_array = vc.add_items([RDF::URI("http://example.org/individual/b1"),
                          RDF::URI("http://example.org/individual/b2"),
                          RDF::URI("http://example.org/individual/b3")])

vc.persist!
vci_array.each { |vci| vci.persist! }



rep = ActiveTriples::Repositories.repositories[:default]
ivs = rep.instance_variables
ivs.each { |var| puts("#{rep.instance_variable_get(var )}") }
# sqlite3:db/triples.sqlite
# RDF::DataObjects::Adapters::Sqlite3



sqlite3:db/triples.sqlite3
RDF::DataObjects::Adapters::Sqlite3


# after creating one object when DO is created in initializer -- SAME when adding rep directly
sqlite3:db/triples.sqlite
RDF::DataObjects::Adapters::Sqlite3
{}
=> [:@db, :@adapter, :@nodes]