package dao;

import model.Board;
import model.BoardRe;
import model.Data;

import java.util.List;
import java.util.Map;

public interface BoardMapper {
    int deleteByPrimaryKey(Integer boardId);

    int insert(Board record);

    int insertSelective(Board record);

    Board selectByPrimaryKey(Integer boardId);

    int updateByPrimaryKeySelective(Board record);

    int updateByPrimaryKey(Board record);

    List<Board> getAllBoard();

    List<BoardRe> getBoardMap();

    List<Data> getboardData(int boardId);

    List<Board> selectByuserId(int userId);

    Board selectLatest();
}