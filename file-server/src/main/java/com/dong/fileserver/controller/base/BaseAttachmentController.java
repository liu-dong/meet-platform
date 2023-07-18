package com.dong.fileserver.controller.base;

import cn.hutool.core.codec.Base64Decoder;
import cn.hutool.core.util.StrUtil;
import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.exception.AttachmentException;
import com.dong.commoncore.model.ResponseResult;
import com.dong.commoncore.util.AttachmentUtils;
import com.dong.commoncore.util.CommonUtils;
import com.dong.fileserver.entity.base.BaseAttachment;
import com.dong.fileserver.model.AttachmentDTO;
import com.dong.fileserver.service.AttachmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;
import java.util.Arrays;
import java.util.List;

/**
 * 附件Controller 基类
 *
 * @param <E>
 * @param <R>
 */
public abstract class BaseAttachmentController<E extends BaseAttachment, R extends JpaRepository<E, String>> {

    @Value("${support.extend.names:txt,jpg,jpeg,png,gif,pdf,doc,docx,xls,xlsx,rar,zip}")
    private String attUsableTypes;

    private Class<E> entityClass;

    @Autowired
    protected AttachmentService attachmentService;

    @Autowired
    protected R repository;

    /**
     * 附件上传
     */
    @PostMapping("/upload")
    public ResponseResult uploadAttachment(@RequestBody AttachmentDTO file) {
        byte[] byteArray = file.getFileData().getBytes();
        String fileType = AttachmentUtils.getFileType(file.getFileName());
        if (!checkFileType(fileType)) {
            throw new AttachmentException("上传失败！文件格式不在白名单内");
        }
        String id = CommonUtils.getUUID();
        //附件
        E attachment = newInstance();
        attachment.setId(id);
        attachment.setFileData(Base64Decoder.decode(byteArray));
        attachment.setFileType(fileType);
        attachment.setFileName(file.getFileName());
        // 缓存附件数据
        attachmentService.put(id, attachment);
        return ResponseResult.success(id, ResponseMessageConstant.UPLOAD_SUCCESS);
    }

    /**
     * 根据附件ID 获取临时文件图片
     *
     * @param id
     * @param response
     * @author chenyihuan
     * @data 2020年11月12日
     */
    @GetMapping("/temp/getFileData/{id}")
    public void getTempAttachmentData(@PathVariable("id") String id, HttpServletResponse response) {
        E attachment = attachmentService.get(id);
        if (attachment == null) {
            return;
        }
        byte[] fileData = attachment.getFileData();
        String fileType = attachment.getFileType();
        AttachmentUtils.writeToView(fileData, fileType, response);
    }

    /**
     * 删除附件
     *
     * @return
     * @author liuzhiwen
     * @data 2020年6月3日
     */
    @GetMapping("/remove/{id}")
    public ResponseResult remove(@PathVariable("id") String id) {
        try {
            attachmentService.remove(id);
            // 删除数据库附件
            repository.findById(id).ifPresent(attachment -> repository.remove(id));
            return ResponseResult.success(ResponseMessageConstant.DELETE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseResult.error(ResponseMessageConstant.DELETE_ERROR);
        }
    }

    public E newInstance() {
        if (getEntityClass() != null) {
            try {
                return getEntityClass().newInstance();
            } catch (Exception e) {
                throw new RuntimeException(e);//NOSONAR
            }
        } else {
            return null;
        }
    }

    /**
     * Get the class of the entity being managed. <br />
     * If not explicitly specified, the generic type of implementation is used.
     */
    @SuppressWarnings("unchecked")
    public Class<E> getEntityClass() {
        if (entityClass == null) {
            Type type = getClass().getGenericSuperclass();
            if (type instanceof ParameterizedType) {
                ParameterizedType paramType = (ParameterizedType) type;
                if (paramType.getActualTypeArguments().length == 3) {
                    // likely dealing with -> new
                    // EntityHome<Person>().getEntityClass()
                    if (paramType.getActualTypeArguments()[0] instanceof TypeVariable) {
                        throw new IllegalArgumentException(
                                "Could not guess entity class by reflection");
                    }
                    // likely dealing with -> new Home<EntityManager, Person>()
                    // { ... }.getEntityClass()
                    else {

                        entityClass = (Class<E>) paramType
                                .getActualTypeArguments()[0];
                    }
                } else {
                    // likely dealing with -> new PersonHome().getEntityClass()
                    // where PersonHome extends EntityHome<Person>
                    entityClass = (Class<E>) paramType.getActualTypeArguments()[0];

                }
            } else {
                throw new IllegalArgumentException(
                        "Could not guess entity class by reflection");
            }
        }
        return entityClass;
    }

    public boolean checkFileType(String fileType) {
        List<String> types = Arrays.asList(attUsableTypes.split(StrUtil.COMMA));
        return types.contains(fileType);
    }
}
