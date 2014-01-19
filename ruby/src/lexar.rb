require_relative 'token'

class Lexar
  def initialize(input)
    @input = input
    @return_previous_token = false
  end

  def get_next_token
    if @return_previous_token
      @return_previous_token = false
      return @previous_token
    end

    token = Token.new

    @input.lstrip!

    # Operator mapping
    # a = +
    # b = -
    # c = *
    # d = /
    # e = (
    # f = )

    case @input
      when /\Aa/ then
        token.kind = Token::PLUS
      when /\Ab/ then
        token.kind = Token::MINUS
      when /\Ac/ then
        token.kind = Token::MULTIPLY
      when /\Ad/ then
        token.kind = Token::DIVIDE
      when /\A\d+(\.\d+)?/
        token.kind = Token::NUMBER
        token.value = $&.to_f
      when /\Ae/
        token.kind = Token::LPAREN
      when /\Af/
        token.kind = Token::RPAREN
      when ''
        token.kind = Token::EXPR_END
    end

    raise 'Unknown token' if token.unknown?
    @input = $'

    @previous_token = token
    token
  end

  def revert
    @return_previous_token = true
  end
end
