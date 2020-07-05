package fr.masociete.neomessage.test;

import java.io.FileWriter;
import java.io.IOException;

public class TestOut {

	public static void main(String[] args) throws IOException {

		String text = "Bonjour" + " à tous<br />" + "durant cette<br /><span style='position:relative;left:20px;display:block'>formation Java</span>";

		System.out.println(text);
		FileWriter writer = new FileWriter("test.html");
		writer.write(text);
		writer.flush();
		writer.close();
	}

}
