package dao;

import model.Data;
import model.SubBoard;
import model.SubBoardData;

import java.util.List;

public interface SubboardMapper {
    int deleteByPrimaryKey(Integer subboardId,Integer boradId);

    int insert(SubBoard  subBoard);

    int insertSelective(SubBoard record);

    SubBoard selectByPrimaryKey(Integer boardId, Integer subBoardId);

    int updateByPrimaryKeySelective(SubBoard record);

    int updateByPrimaryKey(SubBoard record);

    List<SubBoard> getAllSubboard();

    List<SubBoardData> getsubboardMap(int boardId, int subboardId);
}
