package normal;

import java.util.List;

public class Log {
    private String timestamp;
    private List<String> visibility;
    private Severity severity;
    private Message message;

    public String getTimestamp() {
        return timestamp;
    }

    public List<String> getVisibility() {
        return visibility;
    }

    public Severity getSeverity() {
        return severity;
    }

    public Message getMessage() {
        return message;
    }

    public void setTimestamp(String timestamp) {
        this.timestamp = timestamp;
    }

    public void setVisibility(List<String> visibility) {
        this.visibility = visibility;
    }

    public void setSeverity(Severity severity) {
        this.severity = severity;
    }

    public void setMessage(Message message) {
        this.message = message;
    }

    @Override
    public String toString() {
        return "normal.Log{" +
                "timestamp=" + timestamp +
                ", visibility=" + visibility +
                ", severity=" + severity +
                ", message=" + message.toString() +
                '}';
    }
}
