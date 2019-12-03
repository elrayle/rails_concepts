# To run...
#   $ cdd
#   $ cd other/rails_concepts/lib/ruby_concepts
#   $ irb
#   > load 'test_module_under_class.rb'
class A
  def a_method
    puts("class A instance method")
    false
  end
end

class A
  module B
    def b_method
      puts("class B instance method")
    end
  end
end

class C
  include A::B
end

a = A.new
a.a_method
# a.b_method # a doesn't know about methods in modules under them unless they include the module

c = C.new
# c.a_method # classes including a module defined under another class do not know anything about the other class' methods
c.b_method
