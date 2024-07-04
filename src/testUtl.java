import org.junit.Before;
import org.junit.After;
import org.junit.Test;
import static org.junit.Assert.*;

import gnu.io.CommPortIdentifier;
import gnu.io.NoSuchPortException;
import gnu.io.PortInUseException;
import gnu.io.SerialPort;
import gnu.io.UnsupportedCommOperationException;

import java.util.ArrayList;
import java.util.List;
import java.util.TooManyListenersException;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

public class testUtl {

    private SerialPort serialPort;
    private final CountDownLatch latch = new CountDownLatch(1);
    private String receivedData = "";

    @Before
    public void setUp() throws Exception {
        serialPort = utl.openSerialPort("COM3", 115200);
    }

    @After
    public void tearDown() {
        if (serialPort != null) {
            utl.closeSerialPort(serialPort);
        }
    }

    @Test
    public void testSerialCommunication() throws Exception {
        String s = "6";
        byte[] b = s.getBytes();
        utl.sendData(serialPort, b);

        ArrayList<String> receive = new ArrayList<>();

        utl.setListenerToSerialPort(serialPort, event -> {
            if (event.getEventType() == SerialPortEvent.DATA_AVAILABLE) {
                try {
                    byte[] bytes = utl.readData(serialPort);
                    String x = new String(bytes);
                    receive.add(x);
                    if (x.contains("*")) {
                        receivedData = String.join("", receive);
                        System.out.println("收到的数据：" + receivedData);
                        latch.countDown();
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });

        // Wait for the response, but no longer than 10 seconds
        assertTrue("Timed out waiting for response", latch.await(10, TimeUnit.SECONDS));

        assertFalse("Received data should not be empty", receivedData.isEmpty());
        assertTrue("Received data should contain 'e:'", receivedData.contains("e:"));
        assertTrue("Received data should contain 'me:'", receivedData.contains("me:"));

        String light1 = receivedData.substring(receivedData.indexOf("e:") + 3, receivedData.indexOf("is") - 1);
        System.out.println("Light1: " + light1);
        assertFalse("Light1 should not be empty", light1.isEmpty());

        String home = receivedData.substring(receivedData.indexOf("me:") + 4, receivedData.indexOf("Hu"));
        System.out.println("Home: " + home);
        assertTrue("Home should be either 'yes' or 'no'", home.equals("yes") || home.equals("no"));

        String homeNumeric = home.equals("yes") ? "1" : "0";
        System.out.println("Home (numeric): " + homeNumeric);
        assertTrue("Home (numeric) should be either '1' or '0'", homeNumeric.equals("1") || homeNumeric.equals("0"));
    }
    
    @Test
    public void testGetSerialPortList() {
        List<String> ports = utl.getSerialPortList();
        assertNotNull(ports);
        // Add more specific assertions based on your environment
    }
    
    @Test
    public void testOpenSerialPort() throws NoSuchPortException, PortInUseException, UnsupportedCommOperationException {
        // Assuming you have a valid port name. Replace "COM1" with a valid port for your system.
        serialPort = utl.openSerialPort("COM1");
        assertNotNull(serialPort);
        assertTrue(serialPort.isOpened());
    }

    @Test
    public void testOpenSerialPortWithBaudRate() throws NoSuchPortException, PortInUseException, UnsupportedCommOperationException {
        serialPort = utl.openSerialPort("COM1", 9600);
        assertNotNull(serialPort);
        assertEquals(9600, serialPort.getBaudRate());
    }

    @Test
    public void testSendAndReadData() throws NoSuchPortException, PortInUseException, UnsupportedCommOperationException {
        serialPort = utl.openSerialPort("COM1");
        byte[] dataToSend = "Test Data".getBytes();
        utl.sendData(serialPort, dataToSend);
        
        // Note: This test assumes that the sent data is immediately available to read.
        // In practice, you might need to wait or use a loopback setup.
        byte[] receivedData = utl.readData(serialPort);
        assertArrayEquals(dataToSend, receivedData);
    }

    @Test
    public void testSetListenerToSerialPort() throws NoSuchPortException, PortInUseException, UnsupportedCommOperationException, TooManyListenersException {
        serialPort = utl.openSerialPort("COM1");
        utl.setListenerToSerialPort(serialPort, event -> {
            // Event handling logic
        });
        // Assert that the listener was added successfully
        // This might require exposing the listeners through a method in SerialPort
    }

    @Test(expected = NoSuchPortException.class)
    public void testOpenInvalidPort() throws NoSuchPortException, PortInUseException, UnsupportedCommOperationException {
        utl.openSerialPort("INVALID_PORT");
    }
    public void insertMeasurements(String temp1, String humi1, String light1, String window, String door, String home) {
        String currentTime = LocalDateTime.now().format(formatter);

        try (Connection conn = DatabaseConnection.getConnection()) {
            insertMeasurement(conn, currentTime, "temperature", temp1, "001");
            insertMeasurement(conn, currentTime, "humidity", humi1, "001");
            insertMeasurement(conn, currentTime, "brightness", light1, "002");
            insertMeasurement(conn, currentTime, "windows", window, "003");
            insertMeasurement(conn, currentTime, "door", door, "004");
            insertMeasurement(conn, currentTime, "switch_status", home, "005");
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle exception appropriately
        }
    }

    private void insertMeasurement(Connection conn, String time, String measurementType, String value, String equipmentId) throws SQLException {
        String sql = String.format(INSERT_SQL, measurementType);
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, time);
            pstmt.setString(2, value);
            pstmt.setString(3, equipmentId);
            pstmt.executeUpdate();
        }
    }
}