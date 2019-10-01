class IfTest
  def self.eval_af
    puts( "  in eval_af")
    false
  end

  def self.eval_at
    puts( "  in eval_at")
    true
  end

  def self.eval_bf
    puts( "  in eval_bf")
    false
  end

  def self.eval_bt
    puts( "  in eval_bt")
    true
  end

  def self.call_me
    puts("test af || bf")
    eval_af || eval_bf

    puts("test af || bt")
    eval_af || eval_bt

    puts("test at || bf")
    eval_at || eval_bf

    puts("test at || bt")
    eval_at || eval_bt
  end
end

IfTest.call_me
