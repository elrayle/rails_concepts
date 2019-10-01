class ArgTest
  def has_args(*args)
    puts "has_args(*args)..."
    puts "   args=#{args}"
    puts "sub_args(*args)..."
    sub_args(*args)
    puts "sub_args(args)..."
    sub_args(args)
  end

  def sub_args(*args)
    puts("   args=#{args}")
  end
end
