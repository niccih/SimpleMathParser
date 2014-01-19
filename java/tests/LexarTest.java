import org.junit.*;
import static org.junit.Assert.*;
import java.util.*;
import SimpleMathParser.*;

public class LexarTest {
  private String input;
  private Lexar l;
  private Map<String, Integer> token_operators = new HashMap<String, Integer>();
  private String[] operators = {"a","b","c","d","e","f"};
  @Before
  public void setUp() {
    input = "3a2c4";
    l = new Lexar(input);
    token_operators.put("a", 0);
    token_operators.put("b", 1);
    token_operators.put("c", 2);
    token_operators.put("d", 3);
    token_operators.put("e", 5);
    token_operators.put("f", 6);
  }

  @Test
  public void testLexarInput() {
    assertEquals(input, l.input);
  }

  @Test
  public void testGetNextTokenKind() {
    Token t = l.getNextToken();
    assertEquals(t.getKind(), t.NUMBER);
  }

  @Test
  public void testGetNextTokenValue() {
    Token t = l.getNextToken();
    assertEquals(t.getValue(), String.valueOf(input.charAt(0)));
  }

  @Test
  public void testOperatorKind() {
    for (int i=0; i< operators.length; i++) {
        l = new Lexar(operators[i]);
        Token t = l.getNextToken();
        int kind = t.getKind();
        int op_kind = token_operators.get(operators[i]);
        Assert.assertEquals(kind, op_kind);
    }
  }
}
