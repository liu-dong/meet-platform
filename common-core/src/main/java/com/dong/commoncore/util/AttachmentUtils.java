package com.dong.commoncore.util;

import cn.hutool.core.util.StrUtil;

import javax.activation.MimetypesFileTypeMap;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.swing.*;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;

/**
 * 附件工具类
 *
 * @author liudong
 */
public class AttachmentUtils {
    private static final MimetypesFileTypeMap fileTypeMap = new MimetypesFileTypeMap();

    /**
     * 获取文件类型
     *
     * @return
     */
    public static String getFileType(String fileName) {
        if (StrUtil.isBlank(fileName)) {
            return null;
        }
        int indexOf = fileName.lastIndexOf(".");
        if (indexOf == fileName.length() - 1) {
            return null;
        }
        return fileName.substring(indexOf + 1);
    }


    /**
     * 输出文件数据到页面
     *
     * @param fileData
     * @param fileType
     * @param response
     */
    public static void writeToView(byte[] fileData, String fileType, HttpServletResponse response) {
        writeToViewThumbnail(fileData, fileType, response, 1);
    }

    /**
     * 输出图片到页面 缩略图
     *
     * @param fileData
     * @param fileType
     * @param response
     */
    public static void writeToViewThumbnail(byte[] fileData, String fileType, HttpServletResponse response, float resize) {
        BufferedImage img;
        try {
            Image image = Toolkit.getDefaultToolkit().createImage(fileData);
            if (resize == 1) {
                img = toBufferedImage(image);
            } else {
                img = toBufferedImage(image, resize, resize);
            }
            String contentType = fileTypeMap.getContentType("." + fileType);
            response.setContentType(contentType);
            // 将图像输出到Servlet输出流中。
            ServletOutputStream sos = response.getOutputStream();
            ImageIO.write(img, fileType, sos);
            sos.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    /**
     * 生成图片 原始大小
     *
     * @param image
     * @return
     * @author liuzhiwen
     * @data 2019年6月14日
     */
    public static BufferedImage toBufferedImage(Image image) {
        if (image instanceof BufferedImage) {
            return (BufferedImage) image;
        }
        // This code ensures that all the pixels in the image are loaded
        image = new ImageIcon(image).getImage();
        BufferedImage bimage = null;
        GraphicsEnvironment ge = GraphicsEnvironment.getLocalGraphicsEnvironment();

        int width = image.getWidth(null);
        int height = image.getHeight(null);

        try {
            int transparency = Transparency.OPAQUE;
            GraphicsDevice gs = ge.getDefaultScreenDevice();
            GraphicsConfiguration gc = gs.getDefaultConfiguration();
            bimage = gc.createCompatibleImage(width, height, transparency);
        } catch (HeadlessException e) {
            // The system does not have a screen
        }
        if (bimage == null) {
            // Create a buffered image using the default color model
            int type = BufferedImage.TYPE_INT_RGB;
            bimage = new BufferedImage(width, height, type);
        }
        // Copy image to buffered image
        Graphics g = bimage.createGraphics();
        // Paint the image onto the buffered image
        g.drawImage(image, 0, 0, null);
        g.dispose();
        return bimage;
    }

    /**
     * 生成图片 按比例生成缩略图
     *
     * @param image
     * @param resizeWidth
     * @param resizeHeight
     * @return
     * @author liuzhiwen
     * @data 2019年6月14日
     */
    public static BufferedImage toBufferedImage(Image image, float resizeWidth, float resizeHeight) {
        BufferedImage im = toBufferedImage(image);
        /*原始图像的宽度和高度*/
        int width = im.getWidth();
        int height = im.getHeight();
        /*调整后的图片的宽度和高度*/
        int toWidth = (int) (Float.parseFloat(String.valueOf(width)) * resizeWidth);
        int toHeight = (int) (Float.parseFloat(String.valueOf(height)) * resizeHeight);
        /*新生成结果图片*/
        BufferedImage bufferedImage = new BufferedImage(toWidth, toHeight, BufferedImage.TYPE_INT_RGB);
        bufferedImage.getGraphics().drawImage(im.getScaledInstance(toWidth, toHeight, java.awt.Image.SCALE_SMOOTH), 0, 0, null);
        return bufferedImage;
    }

}
