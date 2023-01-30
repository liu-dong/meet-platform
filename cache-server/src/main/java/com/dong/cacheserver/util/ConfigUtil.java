package com.dong.cacheserver.util;

import org.apache.commons.lang3.StringUtils;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PropertiesLoaderUtils;

import java.util.Properties;

public class ConfigUtil {

    /**
     * 根据配置键读取配置文件的配置
     *
     * @param configKey
     * @return String
     */
    public static String getConfigVal(String configKey) {
        String val = null;
        if (StringUtils.isEmpty(configKey)) {
            return val;
        }

        try {
            Resource resource = new ClassPathResource("/application.properties");
            Properties properties = PropertiesLoaderUtils.loadProperties(resource);

            val = properties.getProperty(configKey);

        } catch (Exception e) {
            System.out.println(e.toString());
        }

        return val;
    }
}
