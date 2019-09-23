package com.haoxuer.ucms.questions.data.entity;

import com.haoxuer.discover.config.data.entity.User;
import com.haoxuer.discover.data.entity.AbstractEntity;
import lombok.Data;

import javax.persistence.*;

/**
 * 提问
 *
 * @author ada
 */
@Data
@Entity
@Table(name = "question")
public class Question extends AbstractEntity {

    public static Question fromId(Long id) {
        Question result = new Question();
        result.setId(id);
        return result;
    }

    /**
     * 该问题有多少个回答
     */
    private Integer answers;
    /**
     * 问题分类
     */
    @JoinColumn
    @ManyToOne()
    private QuestionCatalog catalog;
    /**
     * 标题
     */
    private String contents;
    /**
     * 该问题有多少个人收藏
     */
    private Integer favorites;
    /**
     * 图片集合
     */
    private String images;
    /**
     * 是否解决
     */
    private Integer state;
    /**
     * 标题
     */
    private String title;
    /**
     * 用户
     */
    @JoinColumn(name = "userid")
    @ManyToOne(fetch = FetchType.LAZY)
    private User user;
    /**
     * 该问题有多少个查看
     */
    private Integer views;
    /**
     * 该问题有多少个投票
     */
    private Integer votes;


}
