import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        ArrayList<Tool> tools = new ArrayList<Tool>();
        Saegen saegen1 = new Saegen(2);
        Saegen saegen2 = new Saegen(1);
        Haemmer haemmer1 = new Haemmer(1);
        Naegel naegel1 = new Naegel(1);
        Naegel naegel2 = new Naegel(2);kf
        Scheren scheren1 = new Scheren(2);
        tools.add(saegen1);
        tools.add(saegen2);
        tools.add(haemmer1);
        tools.add(naegel1);
        tools.add(naegel2);
        tools.add(scheren1);
        Kiste kiste = new Kiste(tools);
        ArrayList<Tool> result_gro = kiste.gewicht_grosser();
        System.out.println("Tools mit gewicht > als 1:");
        for (Tool tool : result_gro) {
            System.out.println(tool);
            System.out.println(tool.gewicht);
        }
        System.out.println("Tools die schneiden:");
        ArrayList<Tool> result_sch = kiste.schneidet();
        for (Tool tool : result_sch) {
            System.out.println(tool);
            System.out.println(tool.schneidet);
        }
    }
}

class Tool {
    public int gewicht = 0;
    public boolean schneidet = false;
}

class Saegen extends Tool {
    public Saegen(int gewicht) {
        this.gewicht = gewicht;
        this.schneidet = true;
    }
}

class Haemmer extends Tool {
    public Haemmer(int gewicht) {
        this.gewicht = gewicht;
        this.schneidet = false;
    }
}

class Naegel extends Tool {
    public Naegel(int gewicht) {
        this.gewicht = gewicht;
        this.schneidet = false;
    }
}

class Scheren extends Tool {
    public Scheren(int gewicht) {
        this.gewicht = gewicht;
        this.schneidet = true;
    }
}

class Kiste {
    public ArrayList<Tool> tools;

    public Kiste(ArrayList<Tool> tools) {
        this.tools = tools;
    }

    public ArrayList<Tool> gewicht_grosser() {
        ArrayList<Tool> results = new ArrayList<Tool>();
        for (Tool tool : this.tools) {
            if (tool.gewicht > 1) {
                results.add(tool);
            }
        }
        return results;
    }

    public ArrayList<Tool> schneidet() {
        ArrayList<Tool> results = new ArrayList<Tool>();
        for (Tool tool : this.tools) {
            if (tool.schneidet) {
                results.add(tool);
            }
        }
        return results;
    }

}