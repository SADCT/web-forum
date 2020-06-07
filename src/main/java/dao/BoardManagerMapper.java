package dao;

import model.BoardManagerKey;

public interface BoardManagerMapper {
    int deleteByPrimaryKey(BoardManagerKey key);

    int insert(BoardManagerKey record);

    int insertSelective(BoardManagerKey record);
}