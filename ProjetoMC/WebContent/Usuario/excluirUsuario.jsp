<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.Telefone"%>
<%@page import="dao.TelefoneDao"%>
<%@page import="dao.UsuarioDao"%>


<% 
	UsuarioDao usuarioDao = new UsuarioDao();
	usuarioDao.DeleteUsuario(Integer.parseInt(request.getParameter("id_usuario")));
%>

<script language="JavaScript">
     alert('deletado!');
     window.location.href="gridUsuario.jsp";
 </script>
