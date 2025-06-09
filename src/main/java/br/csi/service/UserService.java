package br.csi.service;

import br.csi.dao.UserDao;

public class UserService {

    private static final UserDao userDao = new UserDao();

    public boolean deletarUsuarop(int id){
        return userDao.deleteUser(id);
    }




}
