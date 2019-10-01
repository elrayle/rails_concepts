class TestParent
  MY_CONSTANT = "Hello"

  class << self
    MY_EIGAN_CONSTANT = "World"
  end
end
class TestChild < TestParent

  begin
    puts "global: MY_CONSTANT=#{MY_CONSTANT}"
  rescue Exception => e
    puts "global: MY_CONSTANT...   ### FAILS ###"
  end

  begin
    puts "global: MY_EIGAN_CONSTANT=#{MY_EIGAN_CONSTANT}"
  rescue Exception => e
    puts "global: MY_EIGAN_CONSTANT...   ### FAILS ###"
  end

  def self.test
    # WORKS
    begin
      puts "self.test: MY_CONSTANT=#{MY_CONSTANT}"
    rescue Exception => e
      puts "self.test: MY_CONSTANT...   ### FAILS ###"
    end
    begin
      puts "self.test: MY_EIGAN_CONSTANT=#{MY_EIGAN_CONSTANT}"
    rescue Exception => e
      puts "self.test: MY_EIGAN_CONSTANT...   ### FAILS ###"
    end
  end

  class << self

    def eigentest
      # FAILS
      begin
        puts "class << self.eigentest: MY_CONSTANT=#{MY_CONSTANT}"
      rescue Exception => e
        puts "class << self.eigentest: MY_CONSTANT...   ### FAILS ###"
      end
      begin
        puts "class << self.eigentest: MY_EIGAN_CONSTANT=#{MY_EIGAN_CONSTANT}"
      rescue Exception => e
        puts "class << self.eigentest: MY_EIGAN_CONSTANT...   ### FAILS ###"
      end
    end
  end
end
TestChild.test
TestChild.eigentest


