package dao;

import modelo.Telefone;
import util.Conexao;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class TelefoneDao {
	
	public TelefoneDao() {

    }
	
	public boolean InsereTelefone(Telefone telefone) {
        Conexao con = null;

        try {

            con = new Conexao();
            con.executeUpdate("insert into telefone (numero) values ('"+ telefone.getNumero() + "')");
            return true;
        } catch (SQLException e) {

            System.out.println("deu errado inserirTelefones()");

            return false;
        }
    }
	
	public ArrayList<Telefone> ArrayListarTelefone() {
        Conexao con = null;
        try {
            con = new Conexao();
            ResultSet RS = con.executeQuery("SELECT * FROM telefone ");
            ArrayList<Telefone> listatelefone = new ArrayList<Telefone>();
            int i = 0;

            while (RS.next()) {
                Telefone telefone = new Telefone();
                telefone.setId_telefone(RS.getInt("id_telefone"));
                telefone.setNumero(RS.getString("numero"));
                listatelefone.add(i, telefone);
                i++;
            }

            return listatelefone;
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }
    }

    public List<Telefone> ListarTelefone() {
        Conexao con = null;
        try {

            con = new Conexao();
            ResultSet RS = con.executeQuery("SELECT * FROM telefone ");
            List<Telefone> listatelefone = new ArrayList<Telefone>();
            int i = 0;

            while (RS.next()) {
                Telefone telefone = new Telefone();
                telefone.setId_telefone(RS.getInt("id_telefone"));
                telefone.setNumero(null);
                listatelefone.add(i, telefone);
                i++;
            }

            return listatelefone;
        } catch (SQLException e) {
            System.out.println("DAO.TelefoneDAO.ListarTelefone()");
            return null;
        }
    }

    public Telefone ListaTelefoneID(int id) {
        Conexao con = null;
        try {
            con = new Conexao();
            ResultSet RS = con.executeQuery("SELECT * FROM telefone where id_telefone=" + id);
            RS.next();
            Telefone telefone = new Telefone();

            telefone.setId_telefone(RS.getInt("id_telefone"));
            telefone.setNumero(RS.getString("numero"));
            return telefone;
        } catch (SQLException e) {
            return null;
        }
    }
	
	public boolean UpdateTelefone(Telefone telefone) {
		
        Conexao con = null;
        try {
            con = new Conexao();
            System.out.println(telefone.getId_telefone());
            con.executeUpdate("UPDATE telefone SET numero='" + telefone.getNumero() + "' where id_telefone=" + telefone.getId_telefone());

            return true;
        } catch (SQLException e) {
            System.out.println("deu errado update Telefone()");
            return false;
        }
    }
	
	public boolean DeleteTelefone(int id) {
        Conexao con = null;
        try {
            con = new Conexao();
            con.executeUpdate("DELETE FROM telefone WHERE id_telefone =" + id);
            System.out.println("deu certo: delete from telefone where id_telefone =" + id);
            return true;
        } catch (SQLException e) {
            System.out.println("deu errado Deletar Telefone()" + e);
            return false;
        }
    }

}
