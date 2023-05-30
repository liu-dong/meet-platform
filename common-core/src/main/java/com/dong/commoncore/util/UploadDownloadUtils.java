package com.dong.commoncore.util;

import cn.hutool.core.date.DateUtil;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.http.entity.ContentType;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * 上传下载
 *
 * @author LD
 */
public class UploadDownloadUtils {

    private static final String PATH = "F:\\MyUploadFile";//上传文件的存储路径


    /**
     * 上传附件到本地 (transferTo)
     *
     * @param file
     * @return
     * @throws IllegalStateException
     */
    public static Map<String, Object> uploadFirst(MultipartFile file) throws IllegalStateException, IOException {
        return uploadFirst(file, PATH);
    }

    /**
     * 上传附件到本地 (transferTo)
     *
     * @param file SpringBoot 使用MultipartFile，SpringMVC 使用CommonsMultipartFile
     * @param path 指定路径
     * @return
     * @throws IllegalStateException
     * @throws IOException
     */
    public static Map<String, Object> uploadFirst(MultipartFile file, String path) throws IllegalStateException, IOException {
        Map<String, Object> result = new HashMap<>();

        File filePath = new File(path);
        // 如果文件夹不存在则创建
        if (!filePath.exists() && !filePath.isDirectory()) {
            if (!filePath.mkdir()) {
                result.put("message", "文件夹创建失败！");
            }
        }
        if (file != null) {
            Map<String, Object> fileData = new HashMap<>();
            // 取得当前上传文件的文件名称
            String myFileName = DateUtil.format(new Date(), "yyyyMMddHHmmssSSS") + file.getOriginalFilename();
            // 如果名称不为"",说明该文件存在，否则说明该文件不存在
            if (!StringUtils.isEmpty(myFileName.trim())) {
                // 定义上传路径
                File localFile = new File(path + "/" + myFileName);
                // 检查文件夹是否存在不存在则新建
                if (!localFile.exists()) {
                    if (!localFile.mkdirs()) {
                        result.put("message", "文件夹创建失败！");
                    }
                }

                file.transferTo(localFile);

                fileData.put("fileName", file.getOriginalFilename());
                fileData.put("newFileName", myFileName);
                fileData.put("filePath", localFile.getPath());
                result.put("data", fileData);
                result.put("message", "上传成功");
                result.put("success", true);
            }
        } else {
            result.put("message", "上传失败，文件内容为空");
            result.put("success", false);
        }
        return result;
    }

    /**
     * 上传附件到本地 (Spring)
     *
     * @param request
     * @return
     */
    public static Map<String, Object> uploadSecond(HttpServletRequest request) throws IOException {
        return uploadSecond(request, null);
    }

    /**
     * 上传附件到本地 (Spring)
     *
     * @param request
     * @param path
     * @return
     * @throws IOException
     */
    public static Map<String, Object> uploadSecond(HttpServletRequest request, String path) throws IOException {
        long startTime = System.currentTimeMillis();
        Map<String, Object> result = new HashMap<>();
        //将当前上下文初始化给  CommonsMultipartResolver （多部分解析器）
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        //检查form中是否有enctype="multipart/form-data"
        if (multipartResolver.isMultipart(request)) {
            //将request变成多部分request
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
            //获取multiRequest 中所有的文件名
            Iterator fileNames = multiRequest.getFileNames();
            while (fileNames.hasNext()) {
                //一次遍历所有文件
                MultipartFile file = multiRequest.getFile(fileNames.next().toString());
                if (file != null) {
                    result = StringUtils.isEmpty(path) ? uploadFirst(file) : uploadFirst(file, path);
                } else {
                    result.put("message", "上传失败");
                    result.put("success", false);
                }
            }
        } else {
            result.put("message", "上传失败");
            result.put("success", false);
        }
        long endTime = System.currentTimeMillis();
        System.out.println("Spring方法的运行时间：" + (endTime - startTime) + "ms");
        return result;
    }

    /**
     * 上传附件到本地 (数据流)
     *
     * @param file
     * @return
     * @throws IOException
     */
    public static Map<String, Object> uploadThird(CommonsMultipartFile file, String path) throws IOException {
        long startTime = System.currentTimeMillis();
        Map<String, Object> result = new HashMap<>();
        System.out.println("fileName：" + file.getOriginalFilename());
        //获取输出流
        OutputStream outputStream = new FileOutputStream(path + "/" + DateUtil.format(new Date(), "yyyyMMddHHmmssSSS")
                + file.getOriginalFilename());
        //获取输入流 CommonsMultipartFile 中可以直接得到文件的流
        InputStream inputStream = file.getInputStream();
        byte[] bts = new byte[1024];
        //一个一个字节的读取并写入
        while (inputStream.read(bts) != -1) {
            outputStream.write(bts);
        }
        outputStream.flush();
        outputStream.close();
        inputStream.close();
        long endTime = System.currentTimeMillis();
        System.out.println("采用流上传的方式的运行时间：" + (endTime - startTime) + "ms");
        return result;
    }

    /**
     * 下载文件
     *
     * @param file
     * @param response
     * @throws IOException
     */
    public static void download(File file, HttpServletResponse response) throws IOException {
        // 获取文件名
        String filename = file.getName();
        // 将文件写入输入流
        FileInputStream fileInputStream = new FileInputStream(file);
        InputStream fis = new BufferedInputStream(fileInputStream);
        byte[] buffer = new byte[fis.available()];
        fis.read(buffer);
        fis.close();
        // 清空response
        response.reset();
        // 设置response的Header
        response.setCharacterEncoding("UTF-8");
        /**
         * Content-Disposition的作用：告知浏览器以何种方式显示响应返回的文件，
         * 用浏览器打开还是以附件的形式下载到本地保存
         *      attachment表示以附件方式下载
         *      inline表示在线打开 "Content-Disposition: inline; filename=文件名.mp3"
         *
         * filename表示文件的默认名称，因为网络传输只支持URL编码的相关支付，
         * 因此需要将文件名URL编码后进行传输,前端收到后需要反编码才能获取到真正的名称
         *
         */
        response.addHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(filename, "UTF-8"));
        // 告知浏览器文件的大小
        response.addHeader("Content-Length", "" + file.length());
        OutputStream outputStream = new BufferedOutputStream(response.getOutputStream());
        response.setContentType("application/octet-stream");
        outputStream.write(buffer);
        outputStream.flush();
    }

    /**
     * 根据文件存放路径下载文件
     *
     * @param allPath
     * @param response
     * @throws IOException
     */
    public static void download(String allPath, HttpServletResponse response) throws IOException {
        // 读到流中
        InputStream inputStream = Files.newInputStream(Paths.get(allPath));// 文件的存放路径
        response.reset();
        response.setContentType("application/octet-stream");
        String filename = new File(allPath).getName();
        response.addHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(filename, "UTF-8"));
        ServletOutputStream outputStream = response.getOutputStream();
        byte[] b = new byte[1024];
        int len;
        //从输入流中读取一定数量的字节，并将其存储在缓冲区字节数组中，读到末尾返回-1
        while ((len = inputStream.read(b)) > 0) {
            outputStream.write(b, 0, len);
        }
        inputStream.close();
    }

    /**
     * 根据数据流下载文件
     *
     * @param inputStream
     * @param fileName
     * @param response
     * @throws IOException
     */
    public static void download(InputStream inputStream, String fileName, HttpServletResponse response) throws IOException {
        // 清空response
        response.reset();
        // 设置response的Header
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/octet-stream");
        response.addHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));
        // 告知浏览器文件的大小
//        response.addHeader("Content-Length", "" + buffer.length);
        byte[] buffer = new byte[1024];
        OutputStream outputStream = response.getOutputStream();
        int len;
        while ((len = inputStream.read(buffer)) != -1) {
            response.getOutputStream().write(buffer, 0, len);
        }

        outputStream.write(buffer);
        outputStream.flush();
        outputStream.close();
        inputStream.close();
    }


    public MultipartFile convertMultipartFile(InputStream inputStream) throws IOException {
        FileItemFactory factory = new DiskFileItemFactory();
        FileItem item = factory.createItem("file", MediaType.MULTIPART_FORM_DATA_VALUE, true, null);
        byte[] buffer = new byte[8192];
        //使用输出流输出输入流的字节
        OutputStream os = item.getOutputStream();
        while (inputStream.read(buffer) != -1) {
            os.write(buffer);
        }
        return new CommonsMultipartFile(item);
    }

    public MultipartFile convertMultipartFile(byte[] testFile) throws IOException {
        InputStream inputStream = new ByteArrayInputStream(testFile);
        return new MockMultipartFile(ContentType.APPLICATION_OCTET_STREAM.toString(), inputStream);
    }
}
