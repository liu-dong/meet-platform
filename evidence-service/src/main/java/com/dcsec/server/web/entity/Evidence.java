package com.dcsec.server.web.entity;

import javax.persistence.*;
import java.util.Date;
import com.dong.commoncore.entity.BaseEntity;

/**
 *  物证
 *
 *  @author LD
 */
@Entity
@Table(name = "base_evidence")
public class Evidence extends BaseEntity {

    private static final long serialVersionUID = 8886349698709136241L;

    /**
     * 
     */
    private String createBy;
    /**
     * 
     */
    private Date lastUpdateTime;
    /**
     * 
     */
    private String lastUpdateBy;
    /**
     * 用户id
     */
    private String userId;
    /**
     * 用户名称
     */
    private String userName;
    /**
     * 仓库id
     */
    private String warehouseId;
    /**
     * 仓库名称
     */
    private String warehouseName;
    /**
     * 案件id
     */
    private String caseId;
    /**
     * 案件名称
     */
    private String caseName;
    /**
     * 部门id
     */
    private String departmentId;
    /**
     * 部门名称
     */
    private String departmentName;
    /**
     * 物证编号
     */
    private String no;
    /**
     * 物证名称
     */
    private String name;
    /**
     * image
     */
    private String image;
    /**
     * 物证序号
     */
    private Integer indexEvi;
    /**
     * 电子标签号
     */
    private String rfid;
    /**
     * 条码标签号
     */
    private String barCode;
    /**
     * 物证持有人
     */
    private String owner;
    /**
     * 扣押人
     */
    private String distrainer;
    /**
     * 是否暂存
     */
    private Integer isTempStorate;
    /**
     * 物证状态
     */
    private Integer status;
    /**
     * 存放期限
     */
    private Date validDate;
    /**
     * 备注
     */
    private Object memo;
    /**
     * 是否已写标签号
     */
    private Integer isRfidWrite;
    /**
     * 是否打印条码
     */
    private Integer isBarCodePrint;
    /**
     * 物证视频
     */
    private String video;
    /**
     * 物证属性
     */
    private String attribute;
    /**
     * 物证属性名称
     */
    private String attributename;
    /**
     * 案件生效日期
     */
    private Date takeeffecttime;

    @Column(name = "create_by")
    public String getCreateBy(){
        return this.createBy;
    }

    public void setCreateBy(String createBy){
        this.createBy = createBy;
    }

    @Column(name = "last_update_time")
    public Date getLastUpdateTime(){
        return this.lastUpdateTime;
    }

    public void setLastUpdateTime(Date lastUpdateTime){
        this.lastUpdateTime = lastUpdateTime;
    }

    @Column(name = "last_update_by")
    public String getLastUpdateBy(){
        return this.lastUpdateBy;
    }

    public void setLastUpdateBy(String lastUpdateBy){
        this.lastUpdateBy = lastUpdateBy;
    }

    @Column(name = "user_id")
    public String getUserId(){
        return this.userId;
    }

    public void setUserId(String userId){
        this.userId = userId;
    }

    @Column(name = "user_name")
    public String getUserName(){
        return this.userName;
    }

    public void setUserName(String userName){
        this.userName = userName;
    }

    @Column(name = "warehouse_id")
    public String getWarehouseId(){
        return this.warehouseId;
    }

    public void setWarehouseId(String warehouseId){
        this.warehouseId = warehouseId;
    }

    @Column(name = "warehouse_name")
    public String getWarehouseName(){
        return this.warehouseName;
    }

    public void setWarehouseName(String warehouseName){
        this.warehouseName = warehouseName;
    }

    @Column(name = "case_id")
    public String getCaseId(){
        return this.caseId;
    }

    public void setCaseId(String caseId){
        this.caseId = caseId;
    }

    @Column(name = "case_name")
    public String getCaseName(){
        return this.caseName;
    }

    public void setCaseName(String caseName){
        this.caseName = caseName;
    }

    @Column(name = "department_id")
    public String getDepartmentId(){
        return this.departmentId;
    }

    public void setDepartmentId(String departmentId){
        this.departmentId = departmentId;
    }

    @Column(name = "department_name")
    public String getDepartmentName(){
        return this.departmentName;
    }

    public void setDepartmentName(String departmentName){
        this.departmentName = departmentName;
    }

    @Column(name = "no")
    public String getNo(){
        return this.no;
    }

    public void setNo(String no){
        this.no = no;
    }

    @Column(name = "name")
    public String getName(){
        return this.name;
    }

    public void setName(String name){
        this.name = name;
    }

    @Column(name = "image")
    public String getImage(){
        return this.image;
    }

    public void setImage(String image){
        this.image = image;
    }

    @Column(name = "index_evi")
    public Integer getIndexEvi(){
        return this.indexEvi;
    }

    public void setIndexEvi(Integer indexEvi){
        this.indexEvi = indexEvi;
    }

    @Column(name = "rfid")
    public String getRfid(){
        return this.rfid;
    }

    public void setRfid(String rfid){
        this.rfid = rfid;
    }

    @Column(name = "bar_code")
    public String getBarCode(){
        return this.barCode;
    }

    public void setBarCode(String barCode){
        this.barCode = barCode;
    }

    @Column(name = "owner")
    public String getOwner(){
        return this.owner;
    }

    public void setOwner(String owner){
        this.owner = owner;
    }

    @Column(name = "distrainer")
    public String getDistrainer(){
        return this.distrainer;
    }

    public void setDistrainer(String distrainer){
        this.distrainer = distrainer;
    }

    @Column(name = "is_temp_storate")
    public Integer getIsTempStorate(){
        return this.isTempStorate;
    }

    public void setIsTempStorate(Integer isTempStorate){
        this.isTempStorate = isTempStorate;
    }

    @Column(name = "status")
    public Integer getStatus(){
        return this.status;
    }

    public void setStatus(Integer status){
        this.status = status;
    }

    @Column(name = "valid_date")
    public Date getValidDate(){
        return this.validDate;
    }

    public void setValidDate(Date validDate){
        this.validDate = validDate;
    }

    @Column(name = "memo")
    public Object getMemo(){
        return this.memo;
    }

    public void setMemo(Object memo){
        this.memo = memo;
    }

    @Column(name = "is_rfid_write")
    public Integer getIsRfidWrite(){
        return this.isRfidWrite;
    }

    public void setIsRfidWrite(Integer isRfidWrite){
        this.isRfidWrite = isRfidWrite;
    }

    @Column(name = "is_bar_code_print")
    public Integer getIsBarCodePrint(){
        return this.isBarCodePrint;
    }

    public void setIsBarCodePrint(Integer isBarCodePrint){
        this.isBarCodePrint = isBarCodePrint;
    }

    @Column(name = "video")
    public String getVideo(){
        return this.video;
    }

    public void setVideo(String video){
        this.video = video;
    }

    @Column(name = "attribute")
    public String getAttribute(){
        return this.attribute;
    }

    public void setAttribute(String attribute){
        this.attribute = attribute;
    }

    @Column(name = "attributeName")
    public String getAttributename(){
        return this.attributename;
    }

    public void setAttributename(String attributename){
        this.attributename = attributename;
    }

    @Column(name = "takeEffectTime")
    public Date getTakeeffecttime(){
        return this.takeeffecttime;
    }

    public void setTakeeffecttime(Date takeeffecttime){
        this.takeeffecttime = takeeffecttime;
    }

}
