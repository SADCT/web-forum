package model;

import java.io.Serializable;
import java.sql.Timestamp;

public class Topic implements Serializable {
    public static final int IS_DISGEST = 1;

    public static final int NUT_DISGEST = 0;

    private Integer topicId;

    private Integer boardId;

    private String topicTitle;

    private Integer userId;

    private Timestamp createTime;

    private Timestamp lastPost;

    private Integer topicViews;

    private Integer topicReplies;

    private Integer digest;

    private Integer subBoardId;

    public Integer getTopicId() {
        return topicId;
    }

    public void setTopicId(Integer topicId) {
        this.topicId = topicId;
    }

    public Integer getBoardId() {
        return boardId;
    }

    public void setBoardId(Integer boardId) {
        this.boardId = boardId;
    }

    public String getTopicTitle() {
        return topicTitle;
    }

    public void setTopicTitle(String topicTitle) {
        this.topicTitle = topicTitle == null ? null : topicTitle.trim();
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public Timestamp getLastPost() {
        return lastPost;
    }

    public void setLastPost(Timestamp lastPost) {
        this.lastPost = lastPost;
    }

    public Integer getTopicViews() {
        return topicViews;
    }

    public void setTopicViews(Integer topicViews) {
        this.topicViews = topicViews;
    }

    public Integer getTopicReplies() {
        return topicReplies;
    }

    public void setTopicReplies(Integer topicReplies) {
        this.topicReplies = topicReplies;
    }

    public Integer getDigest() {
        return digest;
    }

    public void setDigest(Integer digest) {
        this.digest = digest;
    }

    public Integer getSubBoardId() {
        return subBoardId;
    }

    public void setSubBoardId(Integer subBoardId) {
        this.subBoardId = subBoardId;
    }

}