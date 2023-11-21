import normal.Log;
import normal.LogParser;
import normal.LogStatistics;

import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        String logFilePath = "C:\\Users\\Radu\\Desktop\\MAP\\sem4\\log_file.json";
        ArrayList<Log> logs;
        LogParser logParser = LogParser.getInstance();
        try {
            logs = (ArrayList<Log>) logParser.ParseLogFile(logFilePath);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        LogStatistics.sortBySeverity(logs);
        for(Log log : logs){
            System.out.println(log);
        }
    }
}