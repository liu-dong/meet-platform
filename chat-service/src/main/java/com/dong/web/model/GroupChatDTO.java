package com.dong.web.model;

import lombok.Data;

import java.util.Date;

/**
 * 群聊
 *
 * @author Lenovo
 */
@Data
public class GroupChatDTO {
    /**
     * 主键
     */
    private String id;
    /**
     * 群聊名称
     */
    private String groupChatName;
    /**
     * 群聊类型
     */
    private Integer groupChatType;
    /**
     * 群主
     */
    private String groupOwner;
    /**
     * 群主id
     */
    private String groupOwnerId;
    /**
     * 备注
     */
    private String remark;
    /**
     * 是否删除 0：否、1：是
     */
    private Integer isDelete;
    /**
     * 创建时间
     */
    private Date createTime;
    /**
     * 创建人
     */
    private String createUserId;
    /**
     * 修改时间
     */
    private Date updateTime;
    /**
     * 修改人
     */
    private String updateUserId;

}
