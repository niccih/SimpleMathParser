# require 'lexar'
require_relative 'lexar'

class Parser
  # This class takes in a string of alpha numeric
  # characters, that represent a mathematicl
  # equation. The evaluation process is simply
  # from left to right, with only given parenthesis
  # providing any order of precedence, i.e multiplcation
  # and division does not taken precedence over
  # addition or subtraction.
  #
  def parse(input)
    @lexar = Lexar.new(input)

    expression_value = expression
    token = @lexar.get_next_token
    if token.kind == Token::EXPR_END
      expression_value
    else
      raise 'End expected'
    end
  end

  protected

  def expression
    component1 = number
    expr_operators = [Token::PLUS, Token::MINUS, Token::MULTIPLY, Token::DIVIDE]

    token = @lexar.get_next_token
    while expr_operators.include?(token.kind)
      component2 = number

      if token.kind == Token::PLUS
        component1 += component2
      elsif token.kind == Token::MINUS
        component1 -= component2
      elsif token.kind == Token::MULTIPLY
        component1 *= component2
      else
        component1 /= component2
      end

      token = @lexar.get_next_token
    end

    @lexar.revert
    component1
  end

  def number
    token = @lexar.get_next_token
    
    if token.kind == Token::LPAREN
      value = expression
      expected_rparen = @lexar.get_next_token
      raise 'Unbalanced parenthesis' unless expected_rparen.kind = Token::RPAREN
    elsif token.kind == Token::NUMBER
      value = token.value
    else
      raise 'Not a number'
    end
    value
  end
end
