package com.rise.service.impl;

import com.rise.dao.DaoSupport;
import com.rise.entity.base.BaseUser;

import com.rise.entity.common.RiseAdmin;
import com.rise.entity.common.RiseStudent;
import com.rise.entity.common.RiseTeacher;
import com.rise.service.AdminService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @Author xiaolong
 * @Date 2018/6/5 16:59
 */

@Service("adminServiceImpl")
public class AdminServiceImpl implements AdminService {
    @Resource(name = "daoSupport")
    private DaoSupport dao;


    @Override
    public RiseAdmin getRiseAdmin(String account) throws Exception {
        return (RiseAdmin) dao.findForObject("AdminServiceMapper.getRiseAdmin", account);
    }

    @Override
    public RiseTeacher getRiseTeacher(String account) throws Exception {
        return (RiseTeacher) dao.findForObject("AdminServiceMapper.getRiseTeacher", account);
    }

    @Override
    public RiseStudent getRiseStudent(String account) throws Exception {
        return (RiseStudent) dao.findForObject("AdminServiceMapper.getRiseStudent", account);
    }

    @Override
    public void updateAdminPassword(RiseAdmin riseAdmin) throws Exception {
        dao.update("AdminServiceMapper.updateAdminPassword", riseAdmin);
    }

    @Override
    public void updateTeacherPassword(RiseTeacher riseTeacher) throws Exception {

    }

    @Override
    public void updateStudentPassword(RiseStudent riseStudent) throws Exception {

    }
}
