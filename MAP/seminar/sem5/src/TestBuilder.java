enum Operations{
    equal,greater,less
}
public class TestBuilder {
    String description;
    double expected;
    Operations operation;

    public TestBuilder() {
    }

    public TestBuilder describe(String message) {
        this.description = message;
        return this;
    }

    public TestBuilder expect(double value) {
        this.expected = value;
        return this;
    }

    public TestBuilder equal(){
        operation=Operations.equal;
        return this;
    }
    public TestBuilder greater(){
        operation=Operations.greater;
        return this;
    }
    public TestBuilder less(){
        operation=Operations.less;
        return this;
    }
}
