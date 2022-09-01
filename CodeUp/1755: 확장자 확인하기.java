import java.util.*;

public class main {
    static Scanner s = new Scanner(System.in);

    public static void main(String[] args) {
        String fileName = s.nextLine();
        String ext = fileName.substring(fileName.lastIndexOf("."));

        HashMap<String, String> extension = new HashMap<String, String>();
        extension.put(".dib", "Paint.Picture");
        extension.put(".doc", "Word.Document.8");
        extension.put(".docx", "Word.Document.12");
        extension.put(".htm", "htmfile");
        extension.put(".html", "htmlfile");
        extension.put(".hwp", "Hwp.Document.96");
        extension.put(".hwpx", "Hwp.Document.hwpx.96");
        extension.put(".hwt", "Hwp.Document.hwt.96");
        extension.put(".jpe", "jpegfile");
        extension.put(".jpeg", "jpegfile");
        extension.put(".jpg", "jpegfile");
        extension.put(".ppt", "PowerPoint.Show.8");
        extension.put(".pptx", "PowerPoint.Show.12");
        extension.put(".pptxml", "powerpointxmlfile");

        System.out.println(extension.get(ext));
    }
}
