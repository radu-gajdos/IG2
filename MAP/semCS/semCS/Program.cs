public interface Observer
{
    public void update(string mesaj);
}

public interface Observable
{
    public void update(Observer observer);

    public void notifyAll();
}

public class ActuallObserver : Observer
{

    public ActuallObserver()
    {
    }
    
    public void update(String mesaj)
    {
        Console.WriteLine(mesaj);
    }   
}

public class ActuallObservable : Observable
{
    private List<Observer> observers = new List<Observer>();
    
    public void update(Observer observer)
    {
        observers.Add(observer);
    }

    public void notifyAll()
    {
        foreach (var observer in observers)
        {
            observer.update("observer has been updated!");
        }

        {
            
        }
    }
}

public delegate void UpdateMethod(string mesaj);

public class ObservableWithDelegate
{
    public event UpdateMethod handler;

    public void notify(String mesaj)
    {
        handler.Invoke(mesaj);
    }
}
//
// public class Program
// {
//     public static void Main(string[] args)
//     {
//         ObservableWithDelegate observableWithDelegate = new ObservableWithDelegate();
//         ActuallObserver actuallObserver1 = new ActuallObserver();
//         ActuallObserver actuallObserver2 = new ActuallObserver();
//         observableWithDelegate.handler += actuallObserver1.update;
//         observableWithDelegate.handler += actuallObserver2.update;
//         observableWithDelegate.notify("hahah");
//
//         observableWithDelegate.handler -= actuallObserver2.update;
//         observableWithDelegate.notify("hahah");
//         
//         
//     }
// }

public abstract class Shape
{
    public abstract double area { get; set; }
}

public class Cube : Shape
{
    private double x;

    public Cube(double x)
    {
        this.x = x;
    }
    
    public override double area
    {
        get { return 6 * Math.Pow(x, 2); }
        set { this.x = Math.Sqrt(value)/6; }
    }
}

public class Square : Shape
{
    private double x;

    public Square(double x)
    {
        this.x = x;
    }
    
    public override double area
    {
        get { return Math.Pow(x, 2); }
        set { this.x = Math.Sqrt(value); }
    }
}


public class Program
{
    public static void Main(string[] args)
    {
        Cube cube = new Cube(2);
        Square square = new Square(2);

        Console.WriteLine(cube.area);
        Console.WriteLine(square.area);
        cube.area = 24;
        Console.WriteLine(cube.area);
        square.area = 4;
        Console.WriteLine(square.area);


    }
}

public class Book
{
    private string title;
    private string author;
    private double preis;
    public bool isTaschenbuch { get; }
    
    
    
}

public class BooksDB
{
    private List<Book> books = new List<Book>();

    public BooksDB(List<Book> books)
    {
        this.books = books;
    }

    public void addBook(Book book)
    {
        books.Add(book);
    }

    public void ProcessBooks()
    {
        foreach (Book book in books)
        {
            if (book.isTaschenbuch)
            {
                
            }
        }
    }
}