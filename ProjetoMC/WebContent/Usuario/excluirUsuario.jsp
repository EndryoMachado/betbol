<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.Usuario"%>
<%@page import="dao.UsuarioDao"%>


<% 
	UsuarioDao dao = new UsuarioDao();
	dao.DeleteUsuario(Integer.parseInt(request.getParameter("id_usuario")));
%>

<script language="JavaScript">
     alert('deletado!');
     window.location.href="gridUsuario.jsp";
 </script>