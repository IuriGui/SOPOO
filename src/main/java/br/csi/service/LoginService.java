package br.csi.service;

import br.csi.dao.UserDao;
import br.csi.dao.VendedorDao;
import org.mindrot.jbcrypt.BCrypt;

public class LoginService {

    private UserDao userDao = new UserDao();

    public boolean autenticar(String email, String senha) {

        String senhaBanco = userDao.buscarClientePorEmail(email);
        if(senhaBanco != null){
            return BCrypt.checkpw(senha, senhaBanco);
        }
        return false;



    }

    public String retornarNomeDoUsuario(String email){
        return new VendedorDao().AcharNomeVendedor(userDao.getUserIdByEmail(email));
    }

}
