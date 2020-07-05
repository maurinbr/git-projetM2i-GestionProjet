package fr.masociete.neomessage.singleton;

import fr.masociete.neomessage.modele.MessageModele;

public class NeoMessageManagerSingleton {

	private static NeoMessageManagerSingleton neoMessageManagerSingleton;

	private MessageModele messageModele;

	public static NeoMessageManagerSingleton getInstance() {
		if (neoMessageManagerSingleton == null) {
			neoMessageManagerSingleton = new NeoMessageManagerSingleton();
		}
		return neoMessageManagerSingleton;
	}

	public NeoMessageManagerSingleton() {
		messageModele = new MessageModele();
	}

	public MessageModele getMessageModele() {
		return messageModele;
	}

	public void setMessageModele(MessageModele messageModele) {
		this.messageModele = messageModele;
	}
}