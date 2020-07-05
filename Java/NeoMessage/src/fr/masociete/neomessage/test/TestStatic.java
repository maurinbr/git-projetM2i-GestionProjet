package fr.masociete.neomessage.test;

import fr.masociete.neomessage.dao.MessageDao;
import fr.masociete.neomessage.dto.MessageDto;

public class TestStatic {

	public static void main(String[] args) {

		MessageDto messageDto = new MessageDto();
		messageDto.setMessage("Ceci est un message");

		MessageDto messageDto2 = MessageDao.getInstance();
		messageDto2.setMessage("Ceci est un message 2");

		System.out.println(messageDto);
		System.out.println(messageDto2);

	}

}
