class Token {
  public static final int PLUS = 0;
  public static final int MINUS = 1;
  public static final int MULTIPLY = 2;
  public static final int DIVIDE = 3;
  public static final int NUMBER = 4;
  public static final int LPAREN = 5;
  public static final int RPAREN = 6;
  public static final int EXPR_END = 7;

  private int kind = -1;
  private String value = "";

  public void setKind(int kind) {
    this.kind = kind;
  }

  public void setValue(String value) {
    this.value = value;
  }

  public int getKind() {
    return this.kind;
  }

  public String getValue() {
    return this.value;
  }
}

