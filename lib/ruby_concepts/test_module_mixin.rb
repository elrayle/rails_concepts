class A1
  def m1
    puts "in A.m1"
  end
end


module B1
  def m1
    super
    puts "in B.m1"
  end

end

class C1 < A1
  include B1
end

ai = A1.new
ci = C1.new

ai.m1
ci.m1

