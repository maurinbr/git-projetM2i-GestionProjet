package fr.masociete.neomessage.modele;

import java.util.ArrayList;
import java.util.List;

import fr.masociete.neomessage.dao.MessageDao;
import fr.masociete.neomessage.dto.MessageDto;

public class MessageModele {

	List<MessageDto> messages = new ArrayList<MessageDto>();

	public MessageModele() {
		messages.add(MessageDao.getInstance("Paola"));
		messages.add(MessageDao.getInstance("Envoyer le colis à Bruno",
				"il faut placer le paquet de bonbon dans un colis et l'envoyer à Bruno avec mardi", false, "Remi"));
		messages.add(MessageDao.getInstance("Khelil"));
		messages.add(MessageDao.getInstance());
		messages.add(MessageDao.getInstance("Peggy"));
	}

	public List<MessageDto> getMessages() {
		return messages;
	}

	public void setMessages(List<MessageDto> messages) {
		this.messages = messages;
	}

	public MessageDto get(String numero) {
		int index = Integer.parseInt(numero);
		MessageDto message = messages.get(index);
		return message;
	}
}