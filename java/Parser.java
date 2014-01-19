import java.util.*;

class Parser {
  private Lexar lexar;
  public String parse(String input) {
    this.lexar = new Lexar(input);
    
    String expression_value = expression();
    Token token = this.lexar.getNextToken();
    
    if (token.getKind() == Token.EXPR_END) {
      return expression_value;
    } else {
      return "Error!";
    }
  }

  private String expression() {
    String component1 = number();
    List<Integer> expr_operators = Arrays.asList(Token.PLUS, Token.MINUS, Token.MULTIPLY, Token.DIVIDE);

    Token token = this.lexar.getNextToken();
    while (expr_operators.contains(token.getKind())) {
      String component2 = number();
      int c1 = Integer.parseInt(component1);
      int c2 = Integer.parseInt(component2);
      int result = 0;

      if (token.getKind() == Token.PLUS) {
        result = c1 + c2;
      } else if (token.getKind() == Token.MINUS) {
        result = c1 - c2;
      } else if (token.getKind() == Token.MULTIPLY) {
        result = c1 * c2;
      } else {
        result = c1 / c2; // Divide by zero ??
      }
      component1 = String.valueOf(result);
      token = this.lexar.getNextToken();
    };

    this.lexar.revert();
    return component1;
  }

  private String number() {
    Token token = this.lexar.getNextToken();
    String value = "";

    if (token.getKind() == Token.LPAREN) {
      value = expression();
      Token expected_rparen = this.lexar.getNextToken();
      // Throw exception if parenthesis not balanced
    } else if (token.getKind() == Token.NUMBER) {
      value = token.getValue();
    } else {
      System.out.println("Not a number");
    }
    return value;
  }
}
