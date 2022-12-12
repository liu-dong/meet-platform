package com.dong.commoncore.util;

import java.io.*;

/**
 * @author Lenovo
 */
public class FileUtils {

    //需要被切割文件的路径
    private static String sourcePath = "C:\\Users\\Lenovo\\Desktop\\log\\open-api-server.log";
    //切割后保存的路径
    private static String targPath = "C:\\Users\\Lenovo\\Desktop\\log\\";
    //切割后保存的文件名称
    private static String name = "log";
    //创建新的文件夹的名称
    private static String dirName = "log";
    //切割行数
    private static int maxLineNum = 300000;
    //切割文件名变量
    private static int nameNum = 0;

    private static BufferedWriter bWriter = null;
    private static String readContextStr = "";
    private static String txtPath = "";
    private static int num = 0;

    public static void main(String[] args) throws IOException {
        try (Reader read = new FileReader(sourcePath);
             BufferedReader bReader = new BufferedReader(read)
        ) {
            //创建文件保存的文件夹
            boolean mkdir = new File(targPath + "/" + dirName).mkdir();
            if (!mkdir) {
                System.out.println("创建文件夹失败");
                return;
            }
            System.out.println("======分割开始======");
            while (true) {
                //读取一行数据
                readContextStr = bReader.readLine();
                if (readContextStr == null) {
                    //如果没有数据，则结束
                    flushAndClose();
                    System.out.println("======分割完成======");
                    return;
                } else {
                    if (num == 0) {
                        //如果是分割开始阶段
                        //刷新关闭缓冲流
                        if (bWriter != null) {
                            flushAndClose();
                        }
                        System.out.println("创建新日志文件" + nameNum);
                        //创建保存的文件
                        txtPath = targPath + "/" + dirName + "/" + name + (++nameNum) + ".txt";
                        boolean newFile = new File(txtPath).createNewFile();
                        if (newFile == false) {
                            System.out.println("创建文件失败");
                            return;
                        }
                        //创建新的缓存流
                        bWriter = new BufferedWriter(new FileWriter(txtPath));

                        //写入数据
                        writer();
                    } else {
                        //如果不是分割开始阶段，直接写
                        writer();
                    }
                }
            }
        }
    }

    private static void writer() throws IOException {
        //写入数据
        bWriter.write(readContextStr);
        bWriter.newLine();
        if (num == maxLineNum) {
            num = 0;
        } else {
            num++;
        }
    }

    private static void flushAndClose() throws IOException {
        bWriter.flush();
        bWriter.close();
    }
}
