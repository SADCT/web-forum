package model;

import java.io.Serializable;

public class SubBoard implements Serializable {
    private Integer subboardId;

    private Integer boardId;

    private String subboardName;

    private Integer topicNum;

    public Integer getSubboardId() {
        return subboardId;
    }

    public void setSubboardId(Integer subboardId) {
        this.subboardId = subboardId;
    }

    public Integer getBoardId() {
        return boardId;
    }

    public void setBoardId(Integer boardId) {
        this.boardId = boardId;
    }

    public String getSubboardName() {
        return subboardName;
    }

    public void setSubboardName(String subboardName) {
        this.subboardName = subboardName;
    }

    public Integer getTopicNum() {
        return topicNum;
    }

    public void setTopicNum(Integer topicNum) {
        this.topicNum = topicNum;
    }


}
