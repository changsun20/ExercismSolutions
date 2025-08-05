public class Lasagna {
    private int minutes = 40;
    
    // TODO: define the 'expectedMinutesInOven()' method
    public int expectedMinutesInOven() {
        return minutes;
    }
    
    // TODO: define the 'remainingMinutesInOven()' method
    public int remainingMinutesInOven(int pass) {
        return (minutes - pass);
    }

    // TODO: define the 'preparationTimeInMinutes()' method
    public int preparationTimeInMinutes(int num) {
        return (2*num);
    }

    // TODO: define the 'totalTimeInMinutes()' method
    public int totalTimeInMinutes(int layerNum, int allTime) {
        return (2 * layerNum + allTime);
    }
}
