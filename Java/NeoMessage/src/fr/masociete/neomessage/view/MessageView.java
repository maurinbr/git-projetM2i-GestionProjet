package fr.masociete.neomessage.view;

import fr.masociete.neomessage.dto.MessageDto;
import fr.masociete.neomessage.modele.MessageModele;
import fr.masociete.neomessage.singleton.NeoMessageManagerSingleton;

public class MessageView {

	public static String getList() {
		MessageModele messageModele = NeoMessageManagerSingleton.getInstance().getMessageModele();
		StringBuffer sb = new StringBuffer();
		int i = 0;
		for (MessageDto message : messageModele.getMessages()) {
			sb.append("<tr>");
			sb.append("<td>").append(message.getTitre()).append("</td>");
			sb.append("<td>").append(message.isLu()).append("</td>");
			sb.append("<td>").append(message.getAuteur()).append("</td>");

			sb.append("<td>").append("<a href=\"?action=view&numero=").append(i++).append("\">ouvrir</a>")
					.append("</td>");

			sb.append("</tr>");
		}
		return sb.toString();
	}

	public static String getView(MessageDto message) {

//		String html = "";

//		html += "<div style='border:1px solid red'>";
//		html += "<h1>" + message.getTitre() + "</h1>";
//		html += "<p>" + message.getMessage() + "</p>";
//		html += "<h5>" + message.getAuteur() + "</h5>";
//		html += "<input type='text' value='" + message.isLu() + "'/>";
//		html += "<a href='?action=list'>fermer</a>";
//		html += "</div>";

		StringBuffer sb = new StringBuffer();
		sb.append("<div style='border:1px solid green'>");
		sb.append("<h1>").append(message.getTitre()).append("<h1>");
		sb.append("<p>").append(message.getMessage()).append("</p>");
		sb.append("<h5>").append(message.getAuteur()).append("</h5>");
		sb.append("<input type='text' value='").append(message.isLu()).append("' />");
		sb.append("<a href='?action=list'>fermer</a>");
		sb.append("</div>");
		
		return /*html + "<br /><br />" +*/ sb.toString();
	}
}