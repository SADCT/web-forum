package dao;

import model.Peiwan;


public interface PeiwanMapper {
    int deleteByPrimaryKey(Integer  peiwanId);

    int insert(Peiwan record);

    int insertSelective(Peiwan record);

    Peiwan selectByPrimaryKey(Integer peiwanId);

    int updateByPrimaryKeySelective(Peiwan record);

    int updateByPrimaryKey(Peiwan record);

    Peiwan selectByPeiwanname(String peiwanname);

    int findAdminTotalNum();
}
