<%@page import="modelo.Usuario"%>
<%@page import="modelo.Telefone"%>
<%@page import="dao.UsuarioDao"%>
<%@page import="dao.TelefoneDao"%>
<%
	UsuarioDao usuariodao = new UsuarioDao();
	TelefoneDao telefoneDao = new TelefoneDao();
    Usuario usuario = new Usuario();
    usuario = usuariodao.ListaUsuarioID(Integer.parseInt(request.getParameter("id_usuario")));
    Telefone telefone = new Telefone();
	telefone = telefoneDao.ListaTelefoneID(usuario.getTelefone());
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="../css/forms-style.css">
<title>Alterar Usuario</title>
</head>
<body>
	<div class="main-box">
		<div class="title-box">
			<h1>Alterar Dados</h1>
		</div>
		<div class="forn-box">
			<form action="respAlterUsuario.jsp" method=post name="usuario">
                <input placeholder="Id*" hidden type="text" name="id_usuario" value="<%=usuario.getId() %>">
                <input placeholder="Id*" disabled type="text" name="id_usuario" value="<%=usuario.getId() %>">
                <input placeholder="Nome*" required type="text" name="nome" value="<%=usuario.getNome_usuario() %>">
                <input placeholder="Email*" required type="text" name="email" value="<%=usuario.getEmail() %>">
                 <input placeholder="Id_telefone" hidden type="text" name="id_telefone" value="<%=usuario.getTelefone() %>">
                <input placeholder="Telefone*" required type="text" name="telefone" value="<%=telefone.getNumero() %>"> 
                <input placeholder="Senha*" required type="text" name="senha" value="<%=usuario.getSenha()%>">
                <input type="submit" value="Alterar">
            </form>
		</div>
		<p>
			<sub>*<sub> Campos obrigatórios
		</p>
		<a href="javascript:history.back()"><img src="../img/voltar.png" alt="Voltar"></a>
		<br>
	</div>
</body>
</html>