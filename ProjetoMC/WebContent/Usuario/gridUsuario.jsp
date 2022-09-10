<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Usuario"%>
<%@page import="dao.UsuarioDao"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../css/forms-style.css">
    <title>Listar Usuario</title>
</head>
<style>
/*Estilização de tabelas*/
table{
	margin: auto;
	width: 70%;
	border-collapse: collapse;
	border: 2px solid black;
	
}
  
th{
	padding: 5px;
}

.tabTitulo{
	color: white;
	background-color: green;
	font-weight: bold;
}

input[type=submit], input[type=button] {
	width: 40%;
	margin: 5px auto;
	height: 20%;
	background-color: darkgreen;
	color: #FFFFFF;
	border-radius: 10px;
	border: solid darkgreen;
}

input[type=submit]:hover, input[type=button]:hover {
	border-style: solid;
	color: lightgreen;
}

</style>
<body>
    <div class="main-box" style="width: fit-content;">
		<div class="title-box">
			<h1>Lista de Usuarios</h1>
		</div>
		<div class="form-box">
			<form action="#" method=post name="aluno">
                <div id="listar">
                    <table border="1px">
                        <tr class="tabTitulo">
                            <th>Nome</th>
                            <th>Email</th>
                            <th>Senha</th>
                            <th>Alterar</th>
                            <th>Deletar</th>
                        </tr>
                        <%
                            UsuarioDao usuarioDao = new UsuarioDao();
                            ArrayList<Usuario> usuario = usuarioDao.ArrayListarUsuario();
                            for (Usuario a: usuario){
                            %>
                        <tr>
                            <th style="text-align: left;"><%=a.getNome_usuario() %></th>
                            <th><%=a.getEmail()%></th>
                            <th><%=a.getSenha()%></th>
                            <th><a href="alterarUsuario.jsp?id_usuario=<%=a.getId() %>"> <img
                                    src="../img/caneta.png">
                            </a></th>
                            <th><a href="excluirUsuario.jsp?id_usuario=<%=a.getId() %>"> <img
                                    src="../img/botao-apagar.png">
                            </a></th>
    
                        </tr>
                        <% } %>
                    </table>
                </div>
            </form>
		</div>
		<p>
			<a href="cadastro.html"><input type="button" value="Novo Usuario"></a>
		</p>
		<a href="../index.html"><img src="../img/home.png" alt="Voltar"></a>
		<br>

</body>
</html>