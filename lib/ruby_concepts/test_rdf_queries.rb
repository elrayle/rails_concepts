vc = RDFTypes::VirtualCollectionRDF.create(id:          "123",
                                           title:       "Test Title",
                                           description: "Test description of virtual collection.",
                                           owner:       RDFTypes::PersonRDF.new("http://vivo.cornell.edu/individual/JohnSmith"))
vci_array = vc.add_items([RDF::URI("http://example.org/individual/b1"),
                          RDF::URI("http://example.org/individual/b2"),
                          RDF::URI("http://example.org/individual/b3")])

vc.persist!
vci_array.each { |vci| vci.persist! }

vc.get_items_models

res = vc.query(:predicate => RDFVocabularies::ORE.proxyIn, :object => vc.rdf_subject).statements

r = ActiveTriples::Repositories.repositories[:default]
res = r.query(:predicate => RDFVocabularies::ORE.proxyIn, :object => vc.rdf_subject).statements


