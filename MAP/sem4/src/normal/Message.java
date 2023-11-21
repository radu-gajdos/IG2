package normal;

class Message {
    private String file;
    private String text;

    public Message() {
        // Standardkonstruktor
    }

    public Message(String file, String text) {
        this.file = file;
        this.text = text;
    }

    public String getFile() {
        return file;
    }

    public String getText() {
        return text;
    }
}
