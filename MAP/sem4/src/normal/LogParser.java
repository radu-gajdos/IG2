package normal;

import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.FileReader;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class LogParser {

    private static LogParser instance;

    private LogParser(){

    }

    public static LogParser getInstance() {
        if(instance == null){
            instance = new LogParser();
        }
        return instance;
    }

    public static List<Log> ParseLogFile(String path) throws Exception {
        // Read the JSON file
        FileReader fileReader = new FileReader(path);
        String fileContent = Files.readString(Paths.get(path));
        // Create the Jackson ObjectMapper
        ObjectMapper objectMapper = new ObjectMapper();
        // Parse JSON into a Java object using Jackson
        Log[] logEntries = objectMapper.readValue(fileContent, Log[].class);
        ArrayList<Log> logs = new ArrayList<>(Arrays.stream(logEntries).toList());
        fileReader.close();
        return logs;
    }
}
