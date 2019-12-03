# To run...
#   $ cdd
#   $ cd other/rails_concepts/lib/ruby_concepts
#   $ irb
#   > load 'test_class_defined_multiple_times.rb'

class A
  def a1
    puts( "method a1")
  end
end

class A
  def a2
    puts( "method a2")
  end
end

class B
  def run
    C.new.bc3
    D.new.bd4
  end
end

class B
  class C
    def bc3
      puts( "method bc3")
    end
  end
end

class B
  class D
    def bd4
      puts( "method bd4")
    end
  end
end

puts '-------------'
puts '  Testing A'
puts '-------------'
a = A.new
a.a1 # method a1
a.a2 # method a2

puts '-------------'
puts '  Testing B'
puts '-------------'
b = B.new
b.run # method bc3 & method bd4

c = B::C.new
c.bc3 # method bc3

d = B::D.new
d.bd4 # method bd4

c = C.new # NameError: uninitialized constant C
c.bc3 # undefined method `bc3' for nil:NilClass

d = D.new # NameError: uninitialized constant D
d.bd4 # undefined method `db4' for nil:NilClass
