package normal;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

public class LogStatistics {
    public static void displayLogs(List<Log> logs){
        for(Log log : logs){
            System.out.println(log);
        }
    }

    static Comparator<Log> logComparator = new Comparator<Log>() {
        @Override
        public int compare(Log log1, Log log2) {
            int comparisonResult = log1.getSeverity().compareTo(log2.getSeverity());
            // Reverse it
            return comparisonResult * -1;
        }
    };

    public static List<Log> sortBySeverity(ArrayList<Log> logs){
        logs.sort(logComparator);
        return logs;
    }
}
