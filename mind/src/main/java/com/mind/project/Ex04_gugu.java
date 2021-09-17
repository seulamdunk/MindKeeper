//package com.mind.project;
//
//import java.io.StringWriter;
//
//import org.python.util.PythonInterpreter;
//
//public class Ex04_gugu {
//   public static void main(String[] args) throws Exception {
//      System.setProperty("python.import.site", "false");
//      PythonInterpreter python = new PythonInterpreter();
//      
//      StringWriter out = new StringWriter();
//      python.setOut(out);
//      
//      python.set("dan", 7);
//      python.execfile("C:/workspace/python/project/test/gugu.py");
//      
//      String result = out.toString();
//      System.out.println(result);
//      python.close();
//      
//   }
//}