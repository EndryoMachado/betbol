<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.Telefone"%>
<%@page import="dao.TelefoneDao"%>
<%@page import="dao.UsuarioDao"%>


<% 
	UsuarioDao usuarioDao = new UsuarioDao();
	Usuario usuario = new Usuario();
	TelefoneDao telefoneDao = new TelefoneDao();
    Telefone telefone = new Telefone();
    
	usuario = usuarioDao.ListaUsuarioID(Integer.parseInt(request.getParameter("id_usuario")));
	usuarioDao.DeleteUsuario(usuario.getId());
	telefoneDao.DeleteTelefone(usuario.getTelefone());
	
	
	
%>

<script language="JavaScript">
     alert('deletado!');
     window.location.href="gridUsuario.jsp";
 </script>