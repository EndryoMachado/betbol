<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.Usuario"%>
<%@page import="dao.UsuarioDao"%>


<% 
	UsuarioDao dao = new UsuarioDao();
    Usuario usuario = new Usuario();
    usuario.setId(Integer.parseInt(request.getParameter("id_usuario")));
    usuario.setNome_usuario(request.getParameter("nome"));
    usuario.setEmail(request.getParameter("email"));
    usuario.setSenha(request.getParameter("senha"));
    dao.UpdateUsuario(usuario);
%>

<script language="JavaScript">
     alert('alterado!');
     window.location.href="gridUsuario.jsp";
 </script>