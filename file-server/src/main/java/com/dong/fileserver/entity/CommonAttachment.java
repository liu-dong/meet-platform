package com.dong.fileserver.entity;

import com.dong.fileserver.entity.base.BaseAttachment;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;

/**
 * 附件表
 *
 * @author liudong 2023/07/19
 */
@Entity
@Table (name = "common_attachment")
public class CommonAttachment extends BaseAttachment {

	/**
	 * 关联业务id
	 */
	private String relationId;

	/**
	 * 关联业务模块
	 */
	private String relationModule;

	/**
	 * 文件地址，minio请求路径
	 */
	private String fileUrl;

	/**
	 * 附件类型
	 */
	private String attachmentType;

	/**
	 * 创建时间
	 */
	private Date createTime;

	/**
	 * 创建人id
	 */
	private String createUserId;

	/**
	 * 修改时间
	 */
	private Date updateTime;

	/**
	 * 修改人id
	 */
	private String updateUserId;

	/**
	 * 删除状态：0 未删除、1 已删除
	 */
	private Integer deleteStatus;


 	@Column(name = "relation_id" )
	public String getRelationId() {
		return this.relationId;
	}

	public void setRelationId(String relationId) {
		this.relationId = relationId;
	}

 	@Column(name = "relation_module" )
	public String getRelationModule() {
		return this.relationModule;
	}

	public void setRelationModule(String relationModule) {
		this.relationModule = relationModule;
	}

 	@Column(name = "file_url" )
	public String getFileUrl() {
		return this.fileUrl;
	}

	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}

 	@Column(name = "attachment_type" )
	public String getAttachmentType() {
		return this.attachmentType;
	}

	public void setAttachmentType(String attachmentType) {
		this.attachmentType = attachmentType;
	}

 	@Column(name = "create_time" )
	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

 	@Column(name = "create_user_id" )
	public String getCreateUserId() {
		return this.createUserId;
	}

	public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId;
	}

 	@Column(name = "update_time" )
	public Date getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

 	@Column(name = "update_user_id" )
	public String getUpdateUserId() {
		return this.updateUserId;
	}

	public void setUpdateUserId(String updateUserId) {
		this.updateUserId = updateUserId;
	}

 	@Column(name = "delete_status" )
	public Integer getDeleteStatus() {
		return this.deleteStatus;
	}

	public void setDeleteStatus(Integer deleteStatus) {
		this.deleteStatus = deleteStatus;
	}

}
