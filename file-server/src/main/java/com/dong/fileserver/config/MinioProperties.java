package com.dong.fileserver.config;

import io.minio.MinioClient;
import lombok.Data;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

/**
 * @author liudong
 * @date 2023/7/20
 */
@Data
@Component
@ConfigurationProperties(prefix = "minio")
@EnableConfigurationProperties({MinioProperties.class})
public class MinioProperties implements InitializingBean {

    /**
     * minio地址
     */
    private String url;

    /**
     * 账号
     */
    private String accessKey;

    /**
     * 密码
     */
    private String secretKey;

    /**
     * 桶
     */
    private String bucket;

    public static String URL;
    public static String BUCKET;

    @Override
    public void afterPropertiesSet() {
        URL = url;
        BUCKET = bucket;
    }


    @Bean
    public MinioClient minioClient() {
        return MinioClient.builder()
                .endpoint(url)
                .credentials(accessKey, secretKey)
                .build();
    }
}
