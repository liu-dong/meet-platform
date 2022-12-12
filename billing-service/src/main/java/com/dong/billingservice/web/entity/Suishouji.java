package com.dong.billingservice.web.entity;

import javax.persistence.*;
import java.io.Serializable;

/**
 * null
 *
 * @author liudong 2022/06/30
 */
@Entity
@Table (name = "suishouji")
public class Suishouji implements Serializable {

	private static final long serialVersionUID = 9116398647195881353L;

	private String account;
	private String buyerAcount;
	private String buyerAcountId;
	private String categoryIcon;
	private String categoryId;
	private String categoryName;
	private String content;
	private String currencyAmount;
	private String date;
	private String day;
	private String hours;
	private String minutes;
	private String month;
	private String seconds;
	private String time;
	private String timezoneOffset;
	private String year;
	private String imgId;
	private String itemAmount;
	private String memberId;
	private String memberName;
	private String memo;
	private String projectId;
	private String projectName;
	private String relation;
	private String sId;
	private String sellerAcount;
	private String sellerAcountId;
	private String tranId;
	private String tranName;
	private String tranType;
	private String transferStoreId;
	private String url;

 	@Column(name = "account" )
	public String getAccount() {
		return this.account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

 	@Column(name = "buyer_acount" )
	public String getBuyerAcount() {
		return this.buyerAcount;
	}

	public void setBuyerAcount(String buyerAcount) {
		this.buyerAcount = buyerAcount;
	}

 	@Column(name = "buyer_acount_id" )
	public String getBuyerAcountId() {
		return this.buyerAcountId;
	}

	public void setBuyerAcountId(String buyerAcountId) {
		this.buyerAcountId = buyerAcountId;
	}

 	@Column(name = "category_icon" )
	public String getCategoryIcon() {
		return this.categoryIcon;
	}

	public void setCategoryIcon(String categoryIcon) {
		this.categoryIcon = categoryIcon;
	}

 	@Column(name = "category_id" )
	public String getCategoryId() {
		return this.categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

 	@Column(name = "category_name" )
	public String getCategoryName() {
		return this.categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

 	@Column(name = "content" )
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

 	@Column(name = "currency_amount" )
	public String getCurrencyAmount() {
		return this.currencyAmount;
	}

	public void setCurrencyAmount(String currencyAmount) {
		this.currencyAmount = currencyAmount;
	}

 	@Column(name = "date" )
	public String getDate() {
		return this.date;
	}

	public void setDate(String date) {
		this.date = date;
	}

 	@Column(name = "day" )
	public String getDay() {
		return this.day;
	}

	public void setDay(String day) {
		this.day = day;
	}

 	@Column(name = "hours" )
	public String getHours() {
		return this.hours;
	}

	public void setHours(String hours) {
		this.hours = hours;
	}

 	@Column(name = "minutes" )
	public String getMinutes() {
		return this.minutes;
	}

	public void setMinutes(String minutes) {
		this.minutes = minutes;
	}

 	@Column(name = "month" )
	public String getMonth() {
		return this.month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

 	@Column(name = "seconds" )
	public String getSeconds() {
		return this.seconds;
	}

	public void setSeconds(String seconds) {
		this.seconds = seconds;
	}

 	@Column(name = "time" )
	public String getTime() {
		return this.time;
	}

	public void setTime(String time) {
		this.time = time;
	}

 	@Column(name = "timezone_offset" )
	public String getTimezoneOffset() {
		return this.timezoneOffset;
	}

	public void setTimezoneOffset(String timezoneOffset) {
		this.timezoneOffset = timezoneOffset;
	}

 	@Column(name = "year" )
	public String getYear() {
		return this.year;
	}

	public void setYear(String year) {
		this.year = year;
	}

 	@Column(name = "img_id" )
	public String getImgId() {
		return this.imgId;
	}

	public void setImgId(String imgId) {
		this.imgId = imgId;
	}

 	@Column(name = "item_amount" )
	public String getItemAmount() {
		return this.itemAmount;
	}

	public void setItemAmount(String itemAmount) {
		this.itemAmount = itemAmount;
	}

 	@Column(name = "member_id" )
	public String getMemberId() {
		return this.memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

 	@Column(name = "member_name" )
	public String getMemberName() {
		return this.memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

 	@Column(name = "memo" )
	public String getMemo() {
		return this.memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

 	@Column(name = "project_id" )
	public String getProjectId() {
		return this.projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

 	@Column(name = "project_name" )
	public String getProjectName() {
		return this.projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

 	@Column(name = "relation" )
	public String getRelation() {
		return this.relation;
	}

	public void setRelation(String relation) {
		this.relation = relation;
	}

	@Id
 	@Column(name = "s_id" )
	public String getSId() {
		return this.sId;
	}

	public void setSId(String sId) {
		this.sId = sId;
	}

 	@Column(name = "seller_acount" )
	public String getSellerAcount() {
		return this.sellerAcount;
	}

	public void setSellerAcount(String sellerAcount) {
		this.sellerAcount = sellerAcount;
	}

 	@Column(name = "seller_acount_id" )
	public String getSellerAcountId() {
		return this.sellerAcountId;
	}

	public void setSellerAcountId(String sellerAcountId) {
		this.sellerAcountId = sellerAcountId;
	}

 	@Column(name = "tran_id" )
	public String getTranId() {
		return this.tranId;
	}

	public void setTranId(String tranId) {
		this.tranId = tranId;
	}

 	@Column(name = "tran_name" )
	public String getTranName() {
		return this.tranName;
	}

	public void setTranName(String tranName) {
		this.tranName = tranName;
	}

 	@Column(name = "tran_type" )
	public String getTranType() {
		return this.tranType;
	}

	public void setTranType(String tranType) {
		this.tranType = tranType;
	}

 	@Column(name = "transfer_store_id" )
	public String getTransferStoreId() {
		return this.transferStoreId;
	}

	public void setTransferStoreId(String transferStoreId) {
		this.transferStoreId = transferStoreId;
	}

 	@Column(name = "url" )
	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}
