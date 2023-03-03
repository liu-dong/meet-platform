package com.dong.chat.web.model.dto;

import lombok.Data;

import java.util.Date;

/**
*  群成员
*
*  @author Lenovo
*/
@Data
public class GroupMemberDTO {

    /**
    * 主键
    */
    private String id;

    /**
    * 群id
    */
    private String groupId;

    /**
    * 成员名称
    */
    private String memberName;

    /**
    * 成员id
    */
    private String memberId;

    /**
    * 群职位 member：成员、manager：群管理员、owner：群主
    */
    private String groupPosition;

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
