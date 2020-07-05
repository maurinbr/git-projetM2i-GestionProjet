<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="fr.masociete.neomessage.dto.*"%>
<%@ page import="fr.masociete.neomessage.singleton.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%
// 	System.out.println("\n\n------------------------------------------------");
// Map<String, String[]> mapParametres = request.getParameterMap();
// Iterator<String> iterator = mapParametres.keySet().iterator();
// while (iterator.hasNext()) {
// 	String key = iterator.next();
// 	System.out.println(key + "=" + mapParametres.get(key)[0]);
// }

String numero = request.getParameter("numero");
MessageDto message = NeoMessageManagerSingleton.getInstance().getMessageModele().get(numero);

save(request, message);
%>

<title><%=message.getTitre()%></title>
</head>
<body>
	<h1><%=message.getTitre()%></h1>

	<form method="POST" action="MessageViewer.jsp">
		<input type="hidden" value="<%=request.getParameter("numero")%>"
			name="numero" />
		<ul>
			<li><label>Titre du message</label> <input type="text"
				name="titre" value="<%=message.getTitre()%>" /></li>

			<li><label>Texte du message</label> <textarea name="message"><%=message.getMessage()%></textarea>
			</li>

			<li><label>Message lu ?</label> <input type="text"
				name="lecture" value="<%=message.isLu()%>" /></li>

			<li><label>Auteur</label> <input type="text" name="auteur"
				value="<%=message.getAuteur()%>" /></li>

			<li><input type="submit" value="enregistrer" name="save" /></li>
		</ul>
	</form>

	<a href="MessageController.jsp?action=list">annulation</a>

</body>
</html>
<%!public void save(HttpServletRequest request, MessageDto message) {
		if (request.getParameter("save") != null && request.getParameter("save").equals("enregistrer")) {
			message.setAuteur(request.getParameter("auteur"));
			message.setLu(request.getParameter("lecture").equals("true"));
			message.setMessage(request.getParameter("message"));
			message.setTitre(request.getParameter("titre"));
		}
	}%>