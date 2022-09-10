package dao;

import modelo.Usuario;
import util.Conexao;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDao {
	
	public UsuarioDao() {

    }
	
	public boolean InsereUsuario(Usuario usuario) {
        Conexao con = null;

        try {

            con = new Conexao();
            con.executeUpdate("insert into usuario (nome_usuario, email, senha) values ( '"
                    + usuario.getNome_usuario() + "',' " + usuario.getEmail() + " ',' " + usuario.getSenha() + "')");
            return true;
        } catch (SQLException e) {

            System.out.println("deu errado inserirUsuarios()");

            return false;
        }
    }
	
	public ArrayList<Usuario> ArrayListarUsuario() {
        Conexao con = null;
        try {
            con = new Conexao();
            ResultSet RS = con.executeQuery("SELECT * FROM usuario ");
            ArrayList<Usuario> listausuario = new ArrayList<Usuario>();
            int i = 0;

            while (RS.next()) {
                Usuario usuario = new Usuario();
                usuario.setId(RS.getInt("id_usuario"));
                usuario.setNome_usuario(RS.getString("nome_usuario"));
                usuario.setEmail(RS.getString("email"));
                usuario.setSenha(RS.getString("senha"));
                listausuario.add(i, usuario);
                i++;
            }

            return listausuario;
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }
    }

    public List<Usuario> ListarUsuario() {
        Conexao con = null;
        try {

            con = new Conexao();
            ResultSet RS = con.executeQuery("SELECT * FROM usuario ");
            List<Usuario> listausuario = new ArrayList<Usuario>();
            int i = 0;

            while (RS.next()) {
                Usuario usuario = new Usuario();
                usuario.setId(RS.getInt("id_usuario"));
                usuario.setNome_usuario(null);
                usuario.setEmail(null);
                usuario.setSenha(null);
                listausuario.add(i, usuario);
                i++;
            }

            return listausuario;
        } catch (SQLException e) {
            System.out.println("DAO.UsuarioDAO.ListarUsuario()");
            return null;
        }
    }

    public Usuario ListaUsuarioID(int id) {
        Conexao con = null;
        try {
            con = new Conexao();
            ResultSet RS = con.executeQuery("SELECT * FROM usuario where id_usuario=" + id);
            RS.next();
            Usuario usuario = new Usuario();

            usuario.setId(RS.getInt("id_usuario"));
            usuario.setNome_usuario(RS.getString("nome_usuario"));
            usuario.setEmail(RS.getString("email"));
            usuario.setSenha(RS.getString("senha"));
            return usuario;
        } catch (SQLException e) {
            return null;
        }
    }
	
	public boolean UpdateUsuario(Usuario usuario) {
		
        Conexao con = null;
        try {
            con = new Conexao();
            System.out.println(usuario.getId());
            con.executeUpdate("UPDATE usuario SET nome_usuario='" + usuario.getNome_usuario()
                    + "', email='" + usuario.getEmail() 
                    + "', senha='" + usuario.getSenha()
                    + "' where id_usuario=" + usuario.getId());

            return true;
        } catch (SQLException e) {
            System.out.println("deu errado update Usuario()");
            return false;
        }
    }
	
	public boolean DeleteUsuario(int id) {
        Conexao con = null;
        try {
            con = new Conexao();
            con.executeUpdate("DELETE FROM usuario WHERE id_usuario =" + id);
            System.out.println("deu certo: delete from usuario where id_usuario =" + id);
            return true;
        } catch (SQLException e) {
            System.out.println("deu errado Deletar Usuario()" + e);
            return false;
        }
    }

}
