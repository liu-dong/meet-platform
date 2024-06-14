package com.dcsec.server.web.model.vo;

import lombok.Data;
import java.util.Date;

/**
 *  操作日志
 *
 *  @author LD
 */
@Data
public class EvidenceLogVO{

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
