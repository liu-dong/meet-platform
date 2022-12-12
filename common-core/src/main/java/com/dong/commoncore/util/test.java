package com.dong.commoncore.util;
/*
    Auth:狡猾的皮球

    思路梳理：
        限制条件：
            1.不要阻塞UI线程
            2.文件大小在20G，所以不能全部读入内存
        实现思路：
            1.读取文件的功能一定要用子线程，否则会卡死UI线程
            2.每次读取50kb在内存中，通过翻页实现文件指针偏移
 */

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.RandomAccessFile;
import java.nio.charset.StandardCharsets;

class AsyncReadFile implements Runnable {
    JTextArea textBox;
    int size;
    int offset;
    File file;

    public AsyncReadFile(JTextArea textBox, File file, int offset, int size) {
        this.textBox = textBox;
        this.file = file;
        this.size = size;
        this.offset = offset;
    }

    @Override
    public void run() {
        try {
            byte[] bytes = new byte[size];
            RandomAccessFile randomAccessFile = new RandomAccessFile(file, "rw");
            randomAccessFile.seek(offset);
            int length = randomAccessFile.read(bytes);
//            InputStream is = new FileInputStream(file);
//            int length = is.read(bytes, offset, size);
            String str = new String(bytes, 0, length, StandardCharsets.UTF_8);
            textBox.setText(str);
            randomAccessFile.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}


class Window {
    JTextArea textBox;
    JFrame frame;
    File currentFile;

    int blockSize = 1024*1024;
    int offset = 0;

    public Window() {
        frame = new JFrame("大文件读取demo");
        frame.setSize(640, 480);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        JPanel panel = new JPanel();
        frame.add(panel);
        panel.setLayout(null);

        //选择文件按钮
        JButton btnOpen = new JButton("选择文件");
        btnOpen.setBounds(10, 0, 200, 25);
        btnOpen.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                JFileChooser fileChooser = new JFileChooser();
                // 设置默认显示的文件夹为当前文件夹
                fileChooser.setCurrentDirectory(new File("."));

                //只能选文件
                fileChooser.setFileSelectionMode(JFileChooser.FILES_ONLY);
                fileChooser.setMultiSelectionEnabled(false);

                int result = fileChooser.showOpenDialog(frame);

                if (result == JFileChooser.APPROVE_OPTION) {
                    currentFile = fileChooser.getSelectedFile();
                    offset = 1024*1024*1000;
                    openFile();
                }
            }
        });
        panel.add(btnOpen);

        //文本框
        textBox = new JTextArea();
        textBox.setLineWrap(true);  //自动换行

        //创建滚动条
        JScrollPane scrollBar = new JScrollPane(textBox);
        scrollBar.setBounds(10, 30, 500, 300);
        scrollBar.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_ALWAYS);   //垂直滚动条
        panel.add(scrollBar);

        //上一页
        JButton btnLast = new JButton("上一页");
        btnLast.setBounds(530, 50, 70, 25);
        panel.add(btnLast);
        btnLast.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (currentFile == null) return;
                if (offset - blockSize < 0) {
                    offset = 0;
                } else {
                    offset -= blockSize;
                }
                openFile();
            }
        });

        //下一页
        JButton btnNext = new JButton("下一页");
        btnNext.setBounds(530, 100, 70, 25);
        panel.add(btnNext);
        btnNext.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (currentFile == null) return;
                if (offset + blockSize > currentFile.length()) return;
                offset += blockSize;
                openFile();
            }
        });
        frame.setVisible(true);
    }

    public void openFile() {
        Thread subThread = new Thread(new AsyncReadFile(textBox, currentFile, offset, blockSize));
        subThread.setDaemon(true);
        subThread.start();
    }
}

public class test {

    public static void main(String[] args) {
        Window window = new Window();
    }

}
