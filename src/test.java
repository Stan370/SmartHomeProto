import gnu.io.*;
import jspservlet.com.utl;
import jspservlet.dao.db.BasicTool;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.TooManyListenersException;

public class test {
    public static void main(String[] args) throws NoSuchPortException, PortInUseException, UnsupportedCommOperationException {
        SerialPort serialPort = utl.openSerialPort("COM3", 115200);
        String s="6";
        byte b[]=s.getBytes();
        utl.sendData(serialPort, b);
        ArrayList<String> receive = new ArrayList<String>();
        try {
            utl.setListenerToSerialPort(serialPort, event -> {
                //数据通知
                if (event.getEventType() == SerialPortEvent.DATA_AVAILABLE) {
                    byte[] bytes = utl.readData(serialPort);
                    String x = new String(bytes);
                    receive.add(x);
                    if(x.indexOf("*") != -1){
                        String str = "";
                        for(Iterator iterator = receive.iterator(); iterator.hasNext();){
                            str += iterator.next();
                        }
                        System.out.println("收到的数据：" + str);
                        String light1 = str.substring(str.indexOf("e:")+3,str.indexOf("is")-1);
                        System.out.println(light1);

                        String home = str.substring(str.indexOf("me:")+4,str.indexOf("Hu"));
                        System.out.println(home);
                        if(home.equals("yes")) home="1";
                        else home="0";
                        String humi1 = str.substring(str.indexOf("mi:")+4,str.indexOf("%"));
                        System.out.println(humi1);

                        String temp1 = str.substring(str.indexOf("mp:")+4,str.indexOf("C"));
                        System.out.println(temp1);

                        String window = str.substring(str.indexOf("ow:")+4,str.indexOf("doo"));
                        System.out.println(window);
                        if(window.equals("on")) window="1";
                        else window="0";
                        String door = str.substring(str.indexOf("or:")+4,str.indexOf("*"));
                        System.out.println(door);
                        if(door.equals("on")) door="1";
                        else door="0";
                        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
                        System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
                        String  p=df.format(new Date());
                        System.out.println(p);
                        String sql1 = "insert into measure_data (measure_time,temperature,humidity,hardware_equipment_e_id) values(?,?,?,?)";
                        BasicTool.insertInstance(sql1, p, temp1, humi1,"001");
                        String sql2 = "insert into measure_data (measure_time,brightness,hardware_equipment_e_id) values(?,?,?)";
                        BasicTool.insertInstance(sql2, p, light1, "002");
                        String sql3 = "insert into measure_data (measure_time,windows,hardware_equipment_e_id) values(?,?,?)";
                        BasicTool.insertInstance(sql3, p, window,"003");
                        String sql4 = "insert into measure_data (measure_time,door,hardware_equipment_e_id) values(?,?,?)";
                        BasicTool.insertInstance(sql4, p, door,"004");
                        String sql5= "insert into measure_data (measure_time,switch_status,hardware_equipment_e_id) values(?,?,?)";
                        BasicTool.insertInstance(sql5, p, home,"005");
                    }


                }
            });


        } catch (TooManyListenersException e) {
            e.printStackTrace();
        }
//        try {
//            SerialPort serialPort = utl.openSerialPort("COM3", 115200);
//            new Sender(new Control(serialPort)).start();
//
//        } catch (NoSuchPortException e) {
//            e.printStackTrace();
//        } catch (PortInUseException e) {
//            e.printStackTrace();
//        } catch (UnsupportedCommOperationException e) {
//            e.printStackTrace();
//        }
    }
}
