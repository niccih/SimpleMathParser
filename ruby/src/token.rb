class Token
  PLUS      = 0
  MINUS     = 1
  MULTIPLY  = 2
  DIVIDE    = 3

  NUMBER    = 4

  LPAREN    = 5
  RPAREN    = 6

  EXPR_END  = 7

  attr_accessor :kind
  attr_accessor :value

  def initialize
    @kind = nil
    @value = nil
  end

  def unknown?
    @kind.nil?
  end
end
