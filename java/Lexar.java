
class Lexar {
  public String input = "";

  private boolean returnPreviousToken = false;
  private Token previousToken;

  public Lexar(String input) {
    this.input = input.trim();
  }

  public Token getNextToken() {
    if (this.returnPreviousToken == true) {
      this.returnPreviousToken = false;
      return this.previousToken;
    }

    Token token = new Token();
  
    char c = getNextChar();

    switch (c) {
      case 'a': token.setKind(Token.PLUS); break;
      case 'b': token.setKind(Token.MINUS); break;
      case 'c': token.setKind(Token.MULTIPLY); break;
      case 'd': token.setKind(Token.DIVIDE); break;
      case 'e': token.setKind(Token.LPAREN); break;
      case 'f': token.setKind(Token.RPAREN); break;
      case '\0': token.setKind(Token.EXPR_END); break;
      default:
        token.setKind(Token.NUMBER); 
        String value = String.valueOf(c);

        while (this.input.matches("^[0-9].*")) {
          value = value + getNextChar();
        }
        token.setValue(value);
    }

    this.previousToken = token;
    return token;
  }

  public void revert() {
    this.returnPreviousToken = true;
  }

  private char getNextChar() {
    char c = '\0'; // Empty char

    if (this.input.length() > 0) {
      c = this.input.charAt(0);
      this.input = this.input.substring(1);
    }
    return c;
  }
}
