package dao;

import model.Superadmin;

public interface SuperadminMapper {
    int deleteByPrimaryKey(Integer superadminId);

    int insert(Superadmin record);

    int insertSelective(Superadmin record);

    Superadmin selectByPrimaryKey(Integer superadminId);

    int updateByPrimaryKeySelective(Superadmin record);

    int updateByPrimaryKey(Superadmin record);

    Superadmin selectBySuperadminname(String superadminname);

    int findSuperadminTotalNum();
}
