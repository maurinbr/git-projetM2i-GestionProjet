<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="fr.masociete.neomessage.dao.*"%>
<%@ page import="fr.masociete.neomessage.dto.*"%>
<%@ page import="fr.masociete.neomessage.view.*"%>
<%@ page import="fr.masociete.neomessage.singleton.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gestion des messages</title>
</head>
<body>
	<%
		String action = request.getParameter("action");

	if (action == null) {
		action = "home";
	}

	switch (action) {

	case "show":
	%><h1>Veuillez utiliser 'list' au lieu de 'show'</h1>
	<%
		case "list":
	%><table><%=MessageView.getList()%></table>
	<a href="?action=insert">Ajouter</a>
	<a href="?action=home">Accueil</a>
	<%
		break;

	case "insert":
		MessageDto nouveauMessage = MessageDao.getInstance();
		NeoMessageManagerSingleton.getInstance().getMessageModele().getMessages().add(nouveauMessage);
	%><%=MessageView.getView(nouveauMessage)%>
	<%
		break;

	case "view":
	%><jsp:forward page="MessageViewer.jsp" />
	<%
		break;

		case "home":
	%><h1>Veuillez choisir entre l'action 'list' ou l'action 'view'</h1>
	<a href="?action=list">Afficher la liste des messages</a>
	<%
		break;

		default:
	%><h1>Je ne sais pas quoi faire !</h1>
	<%
		}
	%>
</body>
</html>