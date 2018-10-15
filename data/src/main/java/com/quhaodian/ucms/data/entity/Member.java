package com.quhaodian.ucms.data.entity;

import com.haoxuer.discover.data.entity.AbstractEntity;
import com.haoxuer.discover.user.data.entity.AbstractUser;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Created by cng19 on 2017/6/17.
 */


@Entity
@Table(name = "user_info")
public class Member extends AbstractUser {



    /**
     *电子邮箱
     */
    private String email;

    /**
     * qq
     */
    private String qq;

    /**
     * 性别
     */
    @Column(length = 5)
    private String sex;


    /**
     * 个性签名
     */
    private String note;


    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
