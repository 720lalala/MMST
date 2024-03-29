package cn.edu.lingnan.dto;


import java.sql.Timestamp;
import java.util.Date;

public class FlowSheetDTO {
    private String flowid;
    private float pricea;
    private String payway;
    private String time;
    private String userid;
    private int state;
    /**
     * 默认函数
     */
    public FlowSheetDTO() {
        this(null,0, null,null,null,0);
    }

    /**
     * 构造初始函数
     *
     * @param flowid
     * @param pricea
     * @param payway
     * @param time
     * @param userid
     * @param state
     */
    public FlowSheetDTO(String flowid, float pricea,String payway,String time,String userid,int state) {
        this.flowid=flowid;
        this.pricea=pricea;
        this.payway=payway;
        this.time=time;
        this.userid = userid;
        this.state=state;
    }

    public String getFlowid() {
        return flowid;
    }

    public void setFlowid(String flowid) {
        this.flowid = flowid;
    }

    public float getPricea() {
        return pricea;
    }

    public void setPricea(float pricea) {
        this.pricea = pricea;
    }

    public String getPayway() {
        return payway;
    }

    public void setPayway(String payway) {
        this.payway = payway;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }


}
