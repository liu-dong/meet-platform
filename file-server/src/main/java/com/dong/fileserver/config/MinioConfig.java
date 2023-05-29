package com.dong.fileserver.config;

import io.minio.MinioClient;
import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author liudong 2023/5/28
 */
@Configuration
@ConfigurationProperties(prefix = "minio")
@Data
public class MinioConfig {

    private String url;

    private String accessKey;

    private String secretKey;


    private String bucketName;

    @Bean
    public MinioClient minioClient() {
        return MinioClient.builder()
                .endpoint(url)
                .credentials(accessKey, secretKey)
                .build();
    }
}
