import org.junit.Test;
import static org.junit.Assert.assertEquals;
public class AppTest {
    @Test
    public void testApp() {
        assertEquals("Hello Jenkins!", new App().sayHello());
    }
}