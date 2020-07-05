package fr.masociete.neomessage.dto;

public class MessageDto {

	private String titre = "Titre";

	private String message = "Message par défaut";

	private boolean isLu;

	private String auteur;

	public MessageDto() {

	}

	public MessageDto(String titre, String message, boolean isLu, String auteur) {
		this.titre = titre;
		this.message = message;
		this.isLu = isLu;
		this.auteur = auteur;
	}

	public String getTitre() {
		return titre;
	}

	public void setTitre(String titre) {
		this.titre = titre;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public boolean isLu() {
		return isLu;
	}

	public void setLu(boolean isLu) {
		this.isLu = isLu;
	}

	public String getAuteur() {
		return auteur;
	}

	public void setAuteur(String auteur) {
		this.auteur = auteur;
	}

	@Override
	public String toString() {
		return "MessageDto [titre=" + titre + ", message=" + message + ", isLu=" + isLu + ", auteur=" + auteur + "]";
	}
}