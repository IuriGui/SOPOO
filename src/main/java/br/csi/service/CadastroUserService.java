package br.csi.service;

import br.csi.dao.UserDao;
import br.csi.dao.VendedorDao;
import br.csi.model.User;

public class CadastroUserService {

    private static final UserDao u = new UserDao();


    public boolean criarUser(String email, String senha){

        User user = new User(email, senha);

        return u.createUser(user) > 0;

    }
    public int criarUser(String email, String senha, Boolean ativo){
        User user = new User(email, senha);
        return u.createUser(user, ativo);

    }

    public boolean ativarUsuario(int id)
    {
        return u.ativarUsuario(id);
    }


}
