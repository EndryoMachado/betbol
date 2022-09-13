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
    
    
    usuario.setId(Integer.parseInt(request.getParameter("id_usuario")));
    usuario.setNome_usuario(request.getParameter("nome"));
    usuario.setEmail(request.getParameter("email"));
    usuario.setTelefone(Integer.parseInt(request.getParameter("id_telefone")));
    usuario.setSenha(request.getParameter("senha"));
    usuarioDao.UpdateUsuario(usuario);
    
    telefone.setId_telefone(usuario.getTelefone());
    telefone.setNumero(request.getParameter("telefone"));
    telefoneDao.UpdateTelefone(telefone);
    
%>

<script language="JavaScript">
     alert('alterado!');
     window.location.href="gridUsuario.jsp";
 </script>