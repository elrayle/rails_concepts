# To run...
#   $ cdd
#   $ cd other/rails_concepts/lib/ruby_concepts
#   $ irb
#   > load 'test_args.rb'
class ArgTest
  def has_args(*args)
    puts "has_args(*args)..."
    puts "   args=#{args}"      # args=["foo", 99, [1, 2, 3]]
    puts "sub_args(*args)..."
    sub_args(*args)             # args=["foo", 99, [1, 2, 3]]
    puts "sub_args(args)..."
    sub_args(args)
  end

  def sub_args(*args)
    puts("   args=#{args}")     # args=[["foo", 99, [1, 2, 3]]]
  end

  # testing pass-by-reference and pass-by-value
  def obj_id(arg, new_value)
    puts "INSIDE:      arg.object_id=#{arg.object_id}       arg=#{arg}"
    if arg.is_a? Array
      puts "Adding array value"
      arg << new_value
    elsif arg.is_a? Hash
      puts "Adding key-value to hash"
      key = new_value.keys.first
      val = new_value[key]
      arg[key] = val
    elsif arg.is_a? OtherClass
      puts "Setting value in class instance"
      arg.val = new_value
    else
      puts "DEFAULT: set arg value"
      arg = new_value
    end
    puts "LEAVING:     arg.object_id=#{arg.object_id}       arg=#{arg}"
  end

  def caller
    str_obj = 'a'
    puts "BEFORE:  str_obj.object_id=#{str_obj.object_id}   str_obj=#{str_obj}" # 'a'
    obj_id(str_obj, 'b')
    puts "AFTER:   str_obj.object_id=#{str_obj.object_id}   str_obj=#{str_obj}" # 'a'
    puts
    num_obj = 11
    puts "BEFORE:  num_obj.object_id=#{num_obj.object_id}   num_obj=#{num_obj}" # 11
    obj_id(num_obj, 21)
    puts "AFTER:   num_obj.object_id=#{num_obj.object_id}   num_obj=#{num_obj}" # 11
    puts
    arr_obj = ['foo', 22]
    puts "BEFORE:  arr_obj.object_id=#{arr_obj.object_id}   arr_obj=#{arr_obj}" # ['foo', 22]
    obj_id(arr_obj, 'bar')
    puts "AFTER:   arr_obj.object_id=#{arr_obj.object_id}   arr_obj=#{arr_obj}" # ["foo", 22, "bar"]
    puts
    hsh_obj = { me: 'me', myself: 'myself', i: 'I'}
    puts "BEFORE:  hsh_obj.object_id=#{hsh_obj.object_id}   hsh_obj=#{hsh_obj}" # { me: 'me', myself: 'myself', i: 'I'}
    obj_id(hsh_obj, { alone: 'by myself' })
    puts "AFTER:   hsh_obj.object_id=#{hsh_obj.object_id}   hsh_obj=#{hsh_obj}" # {:me=>"me", :myself=>"myself", :i=>"I", :alone=>"by myself"}
    puts
    obj_obj = OtherClass.new('bird')
    puts "BEFORE:  obj_obj.object_id=#{obj_obj.object_id}   obj_obj=#{obj_obj.val}" # 'bird'
    obj_id(obj_obj, 'dog')
    puts "AFTER:   obj_obj.object_id=#{obj_obj.object_id}   obj_obj=#{obj_obj.val}" # 'dog'
  end

  class OtherClass
    attr_accessor :val
    def initialize(val)
      @val = val
    end
  end
end


a = 'foo'
b = 99
c = [1,2,3]
ArgTest.new.has_args(a,b,c)

ArgTest.new.caller
