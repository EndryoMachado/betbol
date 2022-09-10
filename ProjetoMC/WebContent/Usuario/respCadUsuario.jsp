<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.Usuario"%>
<%@page import="dao.UsuarioDao"%>


<% 
	UsuarioDao dao = new UsuarioDao();
    Usuario usuario = new Usuario();
    usuario.setNome_usuario(request.getParameter("nome"));
    usuario.setEmail(request.getParameter("email"));
    usuario.setSenha(request.getParameter("senha"));
    dao.InsereUsuario(usuario);
%>

<script language="JavaScript">
     alert('cadastrado!');
     window.location.href="../index.html";
 </script>