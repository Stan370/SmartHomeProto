
import gnu.io.*;
import java.util.List;
import java.util.TooManyListenersException;


public class test1 {
    public static void main(String[] args) {
        List<String> portList = utl.getSerialPortList();
        System.out.println(portList);
        try {
            SerialPort serialPort = utl.openSerialPort("COM4", 115200);
            String s = "6";
            byte b[]=s.getBytes();
            utl.sendData(serialPort, b);
            utl.setListenerToSerialPort(serialPort, event -> {
                //数据通知
                if (event.getEventType() == SerialPortEvent.DATA_AVAILABLE) {
                    byte[] bytes = utl.readData(serialPort);
                    System.out.println("收到的数据：" + new String(bytes));
                }
            });
        } catch (NoSuchPortException e) {
            e.printStackTrace();
        } catch (PortInUseException e) {
            e.printStackTrace();
        } catch (UnsupportedCommOperationException e) {
            e.printStackTrace();
        } catch (TooManyListenersException e) {
            e.printStackTrace();
        }
    }
}
