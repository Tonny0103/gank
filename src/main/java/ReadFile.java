import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class ReadFile {
    private final String filePath;

    public ReadFile(String filePath) {
        this.filePath = filePath;
    }

    public String fileContent() {
        StringBuilder fileContent = new StringBuilder();

        File file = new File(filePath);

        try {
            Scanner scanner = new Scanner(file);

            while (scanner.hasNextLine()) {
                fileContent.append(scanner.nextLine());
            }

            return fileContent.toString();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }

        return null;
    }
}
