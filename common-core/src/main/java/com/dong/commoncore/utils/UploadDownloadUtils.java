package com.dong.commoncore.utils;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.lang.time.DateFormatUtils;
import org.apache.http.entity.ContentType;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
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
     * @throws IOException
     */
    public static Map<String, Object> uploadFirst(MultipartFile file) throws IllegalStateException, IOException {
        return uploadFirst(file, PATH);
    }

    /**
     * 上传附件到本地 (transferTo)
     *
     * @param file
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
            // 取得当前上传文件的文件名称
            String myFileName = DateFormatUtils.format(new Date(), "yyyyMMddHHmmssSSS") + file.getOriginalFilename();
            result.put("fileName", file.getOriginalFilename());
            result.put("newFileName", myFileName);
            // 如果名称不为“”,说明该文件存在，否则说明该文件不存在
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
     * @throws IOException
     */
    public static Map<String, Object> uploadSecond(HttpServletRequest request) throws IOException {
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
                    /*String path = PATH +"\\" + file.getOriginalFilename();
                    //上传
                    file.transferTo(new File(path));
                    result.put("message", "上传成功");
                    result.put("success", true);*/
                    uploadFirst(file);
                } else {
                    result.put("message", "上传失败");
                    result.put("success", false);
                }
            }
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
    public static Map<String, Object> uploadThird(@RequestParam("file") CommonsMultipartFile file) throws IOException {
        long startTime = System.currentTimeMillis();
        Map<String, Object> result = new HashMap<>();
        System.out.println("fileName：" + file.getOriginalFilename());
        //获取输出流
        OutputStream outputStream = new FileOutputStream(PATH + "/" + DateFormatUtils.format(new Date(), "yyyyMMddHHmmssSSS")
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
