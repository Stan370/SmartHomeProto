package jspservlet.com;

import gnu.io.*;

import java.util.ArrayList;
import java.util.List;

public class Control {
    public SerialPort serialPort;

    public Control(SerialPort serialPort) {
        this.serialPort = serialPort;
    }

    public void  controlLight(String level){
        List<String> portList = utl.getSerialPortList();
        System.out.println(portList);
        byte b[]=level.getBytes();
        utl.sendData(serialPort, b);
    }

    public void  controlData(){
        List<String> portList = utl.getSerialPortList();
        System.out.println(portList);
        byte b[]="6".getBytes();
        utl.sendData(serialPort, b);
    }

}
