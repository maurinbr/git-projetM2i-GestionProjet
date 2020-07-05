package fr.masociete.neomessage.dao;

import fr.masociete.neomessage.dto.MessageDto;

public class MessageDao {

	public static MessageDto getInstance() {
		return new MessageDto("nouveau titre", "nouveau message", false, "Eric");
	}

	public static MessageDto getInstance(String auteur) {
		return new MessageDto("nouveau titre", "nouveau message", false, auteur);
	}

	public static MessageDto getInstance(String titre, String message, boolean isLu, String auteur) {
		return new MessageDto(titre, message, isLu, auteur);
	}
}