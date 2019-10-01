pr1  = RDFTypes::PersonRDF.new('11')
pr1.rdf_subject
pr1.dump :ntriples

pr2  = RDFTypes::PersonRDF.new('12')
pr2.rdf_subject
pr2.dump :ntriples

pr3  = RDFTypes::PersonRDF.new('13')
pr3.rdf_subject
pr3.dump :ntriples

vci = RDFTypes::VirtualCollectionItemRDF.new('1234')
vci.rdf_subject


vc  = RDFTypes::VirtualCollectionRDF.new
vc  = RDFTypes::VirtualCollectionRDF.new('1123')
vc.rdf_subject
vc.title = "Test Title"
vc.description = "Test Description"
vc.owner = pr1
# vc.owner = vci
# vc.owner = "Test Owner"
vc.dump :ntriples

vc.owner = pr2
vc.dump :ntriples


oa  = RDFTypes::OpenAnnotationRDF.new('345')
oa.rdf_subject


oab = RDFTypes::OpenAnnotationBodyRDF.new('456')
oab.rdf_subject


tg  = RDFTypes::TagAnnotationRDF.new('567')
tg.rdf_subject


stg  = RDFTypes::SemanticTagAnnotationRDF.new('5670')
stg.rdf_subject


cm  = RDFTypes::CommentAnnotationRDF.new('678')
cm.rdf_subject


pr  = RDFTypes::PersonRDF.new('789')
pr.rdf_subject



<http://localhost:3000/individual/vc123> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.openarchives.org/ore/terms/Aggregation> .
<http://localhost:3000/individual/vc123> <http://purl.org/dc/terms/title> \"Test Title\" .
<http://localhost:3000/individual/vc123> <http://purl.org/dc/terms/description> \"Test Description\" .
<http://localhost:3000/individual/vc123> <http://purl.org/dc/terms/creator> <http://vivo.cornell.edu/individual/p789> .
<http://vivo.cornell.edu/individual/p789> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://xmlns.com/foaf/0.1/Person> .


<http://localhost:3000/individual/vc123> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.openarchives.org/ore/terms/Aggregation> .\n
<http://localhost:3000/individual/vc123> <http://purl.org/dc/terms/title> \"Test Title\" .\n
<http://localhost:3000/individual/vc123> <http://purl.org/dc/terms/description> \"Test Description\" .\n
<http://localhost:3000/individual/vc123> <http://purl.org/dc/terms/creator> <http://vivo.cornell.edu/individual/p789> .\n
<http://vivo.cornell.edu/individual/p789> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://xmlns.com/foaf/0.1/Person>


<http://localhost:3000/individual/vc123> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.openarchives.org/ore/terms/Aggregation> .\n
<http://localhost:3000/individual/vc123> <http://purl.org/dc/terms/title> \"Test Title\" .\n
<http://localhost:3000/individual/vc123> <http://purl.org/dc/terms/description> \"Test Description\" .\n
<http://localhost:3000/individual/vc123> <http://purl.org/dc/terms/creator> <http://vivo.cornell.edu/individual/p789> .\n
<http://vivo.cornell.edu/individual/p789> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://xmlns.com/foaf/0.1/Person> .\n


<http://localhost:3000/individual/vc123> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.openarchives.org/ore/terms/Aggregation> .\n
<http://localhost:3000/individual/vc123> <http://purl.org/dc/terms/title> \"Test Title\" .\n
<http://localhost:3000/individual/vc123> <http://purl.org/dc/terms/description> \"Test Description\" .\n
<http://localhost:3000/individual/vc123> <http://purl.org/dc/terms/creator> \"Test Owner\" .\n


<http://localhost:3000/individual/vc123> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.openarchives.org/ore/terms/Aggregation> .\n
<http://localhost:3000/individual/vc123> <http://purl.org/dc/terms/title> \"Test Title\" .\n
<http://localhost:3000/individual/vc123> <http://purl.org/dc/terms/description> \"Test Description\" .\n
<http://localhost:3000/individual/vc123> <http://purl.org/dc/terms/creator> <http://localhost:3000/individual/vci234> .\n
<http://localhost:3000/individual/vci234> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.openarchives.org/ore/terms/Proxy> .




 t1 = AnotherThing.new('1')
 t2 = AnotherThing.new('2')
 t3 = AnotherThing.new('3')
 t4 = AnotherThing.new('4')
 t5 = AnotherThing.new('5')
 t6 = AnotherThing.new('6')
 t7 = AnotherThing.new('7')
 t8 = AnotherThing.new('8')


<http://example.org/things#124> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .\n
<http://example.org/things#124> <http://purl.org/dc/terms/title> \"Resource\" .\n
<http://example.org/things#124> <http://purl.org/dc/terms/description> \"A resource.\" .\n
<http://example.org/things#124> <http://purl.org/dc/terms/creator> <http://example.org/nonowners#789> .\n
<http://example.org/nonowners#789> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .\n



<http://localhost:3000/vc123> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.openarchives.org/ore/terms/Aggregation> .\n
<http://localhost:3000/vc123> <http://purl.org/dc/terms/title> \"Test Title\" .\n
<http://localhost:3000/vc123> <http://purl.org/dc/terms/description> \"Test Description\" .\n
<http://localhost:3000/vc123> <http://purl.org/dc/terms/creator> <http://vivo.cornell.edu/individual/p1> .\n
<http://vivo.cornell.edu/individual/p1> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://xmlns.com/foaf/0.1/Person> .\n



<http://localhost:3000/vc123> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.openarchives.org/ore/terms/Aggregation> .\n
<http://localhost:3000/vc123> <http://purl.org/dc/terms/title> \"Test Title\" .\n
<http://localhost:3000/vc123> <http://purl.org/dc/terms/description> \"Test Description\" .\n
<http://localhost:3000/vc123> <http://purl.org/dc/terms/creator> <http://vivo.cornell.edu/individual/p2> .\n
<http://vivo.cornell.edu/individual/p1> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://xmlns.com/foaf/0.1/Person> .\n
<http://vivo.cornell.edu/individual/p2> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://xmlns.com/foaf/0.1/Person> .\n


Wrong class instance set for class_name gets saved and displayed inconsistently






### To reproduce with a fresh new object...

Set up the classes to use in this example.
```ruby
 class NotAnOwner < ActiveTriples::Resource
    configure :type => RDF::OWL.Thing, :base_uri => 'http://example.org/nonowner#'
 end

 class Owner < ActiveTriples::Resource
    configure :type => RDF::FOAF.Person, :base_uri => 'http://example.org/person#'
 end

 class Thing < ActiveTriples::Resource
   configure :type => RDF::OWL.Thing, :base_uri => 'http://example.org/things#'
   property :title, :predicate => RDF::DC.title
   property :description, :predicate => RDF::DC.description
   property :owner, :predicate => RDF::DC.creator, :class_name => Owner
 end
```
Create object instances to demonstrate how it works with the wrong class.

```ruby
nao_instance = NotAnOwner.new('789')
obj2 = Thing.new('124')
obj2.title = 'Resource'
obj2.description = 'A resource.'
obj2.owner = nao_instance
```

Get the value of owner using several methods.

```
obj2.owner
# => []

obj2.attributes
# => {"id"=>"http://example.org/things#124", "title"=>["Resource"], "description"=>["A resource."], "owner"=>[]}
# Pretty Results
#  {"id"=>"http://example.org/things#124",
#   "title"=>["Resource"],
#   "description"=>["A resource."],
#   "owner"=>[]}

obj2.dump :ntriples
# => "<http://example.org/things#124> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .\n<http://example.org/things#124> <http://purl.org/dc/terms/title> \"Resource\" .\n<http://example.org/things#124> <http://purl.org/dc/terms/description> \"A resource.\" .\n<http://example.org/things#124> <http://purl.org/dc/terms/creator> <http://example.org/nonowner#789> .\n<http://example.org/nonowner#789> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .\n"
# Pretty Results
#  <http://example.org/things#124> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .\n
#  <http://example.org/things#124> <http://purl.org/dc/terms/title> \"Resource\" .\n
#  <http://example.org/things#124> <http://purl.org/dc/terms/description> \"A resource.\" .\n
#  <http://example.org/things#124> <http://purl.org/dc/terms/creator> <http://example.org/nonowner#789> .\n
#  <http://example.org/nonowner#789> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .\n
```

NOTE:  When the class_name of the object instance does not match that of the specified class_name, its value is hidden when accessing the value directly or through getting all attributes, but it still shows up in the ntriples.


### To reproduce by changing the value...

Use same class definitions from above.

Create the object instances to with the correct class.

```ruby
owner = Owner.new('456')
obj = Thing.new('123')
obj.title = 'Resource'
obj.description = 'A resource.'
obj.owner = owner
```

Get the value of owner using several methods.

```
obj.owner
# => [#<Owner:0x3ff6b91b5bf8(default)>]

obj.attributes
# => {"id"=>"http://example.org/things#123", "title"=>["Resource"], "description"=>["A resource."], "owner"=>[#<Owner:0x3ff6b91b5bf8(default)>]}
# Pretty Results
#  {"id"=>"http://example.org/things#123",
#   "title"=>["Resource"],
#   "description"=>["A resource."],
#   "owner"=>[#<Owner:0x3ff6b91b5bf8(default)>]}

obj.dump :ntriples
# => "<http://example.org/things#123> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .\n<http://example.org/things#123> <http://purl.org/dc/terms/title> \"Resource\" .\n<http://example.org/things#123> <http://purl.org/dc/terms/description> \"A resource.\" .\n<http://example.org/things#123> <http://purl.org/dc/terms/creator> <http://example.org/person#456> .\n<http://example.org/person#456> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://xmlns.com/foaf/0.1/Person> .\n"
# Pretty Results
#  "<http://example.org/things#123> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .\n
#  <http://example.org/things#123> <http://purl.org/dc/terms/title> \"Resource\" .\n
#  <http://example.org/things#123> <http://purl.org/dc/terms/description> \"A resource.\" .\n
#  <http://example.org/things#123> <http://purl.org/dc/terms/creator> <http://example.org/person#456> .\n
#  <http://example.org/person#456> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://xmlns.com/foaf/0.1/Person> .\n"
```

Change owner to the wrong class.

```ruby
nao_instance2 = NotAnOwner.new('790')
obj.owner = nao_instance2
````

Get the value of owner using several methods again.

                                                 ```
obj.owner
# => [#<Owner:0x3ff6b91b5bf8(default)>]

obj.attributes
# => {"id"=>"http://example.org/things#123", "title"=>["Resource"], "description"=>["A resource."], "owner"=>[#<Owner:0x3ff6b91b5bf8(default)>]}
# Pretty Results
#  {"id"=>"http://example.org/things#123",
#   "title"=>["Resource"],
#   "description"=>["A resource."],
#   "owner"=>[#<Owner:0x3ff6b91b5bf8(default)>]}

obj.dump :ntriples
# => "<http://example.org/things#123> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .\n<http://example.org/things#123> <http://purl.org/dc/terms/title> \"Resource\" .\n<http://example.org/things#123> <http://purl.org/dc/terms/description> \"A resource.\" .\n<http://example.org/things#123> <http://purl.org/dc/terms/creator> <http://example.org/person#456> .\n<http://example.org/person#456> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://xmlns.com/foaf/0.1/Person> .\n"
# Pretty Results
#  "<http://example.org/things#123> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .\n
#  <http://example.org/things#123> <http://purl.org/dc/terms/title> \"Resource\" .\n
#  <http://example.org/things#123> <http://purl.org/dc/terms/description> \"A resource.\" .\n
#  <http://example.org/things#123> <http://purl.org/dc/terms/creator> <http://example.org/person#456> .\n
#  <http://example.org/person#456> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://xmlns.com/foaf/0.1/Person> .\n"
```





