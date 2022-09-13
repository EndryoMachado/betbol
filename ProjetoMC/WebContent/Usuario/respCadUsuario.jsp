<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.Telefone"%>
<%@page import="dao.UsuarioDao"%>
<%@page import="dao.TelefoneDao"%>


<% 

	TelefoneDao telefoneDao = new TelefoneDao();
	Telefone telefone = new Telefone();
	Telefone ultimoTelefone = new Telefone();
	
	telefone.setNumero(request.getParameter("telefone"));
	telefoneDao.InsereTelefone(telefone);
    ultimoTelefone = telefoneDao.ListarTelefone().get(telefoneDao.ListarTelefone().size()-1);
    
	
	UsuarioDao usuarioDao = new UsuarioDao();
    Usuario usuario = new Usuario();
    usuario.setNome_usuario(request.getParameter("nome"));
    usuario.setEmail(request.getParameter("email"));
    usuario.setSenha(request.getParameter("senha"));
    usuario.setTelefone(ultimoTelefone.getId_telefone());
    
    usuarioDao.InsereUsuario(usuario);
%>

<script language="JavaScript">
     alert('cadastrado!');
     window.location.href="../index.html";
 </script>