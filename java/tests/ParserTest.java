import org.junit.*;
import static org.junit.Assert.*;
import java.util.*;
import SimpleMathParser.*;

public class ParserTest {
  private Parser p = new Parser();
  private String[] inputs = {"3a2c4", "32a2d2", "500a10b66c32", "3ae4c66fb32", "3c4d2aee2a4c41fc4f"};
  private String[] outputs = {"20","17", "14208", "235", "990"};
  @Test
  public void testPraserInput() {
    for (int i = 0; i < inputs.length; i++) {
      System.out.println("Parse: "+inputs[i]);
      String output = p.parse(inputs[i]);
      System.out.println("Output: "+output);
      assertEquals(output, outputs[i]);
    }
  }
}
