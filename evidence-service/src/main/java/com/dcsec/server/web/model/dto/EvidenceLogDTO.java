package com.dcsec.server.web.model.dto;

import lombok.Data;
import java.util.Date;

/**
 *  操作日志
 *
 *  @author LD
 */
@Data
public class EvidenceLogDTO {

    /**
     * 
     */
    private String id;

    /**
     * 
     */
    private String evidenceId;

    /**
     * 
     */
    private String operatorId;

    /**
     * 
     */
    private Date operateDate;

    /**
     * 
     */
    private Integer operateType;

}
