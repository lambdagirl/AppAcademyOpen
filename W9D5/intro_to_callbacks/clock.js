class Clock {
    constructor() {
        // 1. Create a Date object.
        // 2. Store the hours, minutes, and seconds.
        // 3. Call printTime.
        // 4. Schedule the tick at 1 second intervals.
        const currentTime = new Date();

        const hours = currentTime.getHours();
        const minutes = currentTime.getMinutes();
        const seconds = currentTime.getSeconds();

        this.printTime();

        setInterval(this._tick.bind(this), 10000)
    }

    printTime() {
        // Format the time in HH:MM:SS
        // Use console.log to print it.
        const timeString = [currentHours,currentMinutes,currentSeconds].join(":");
        console.log(timeString);
    }

    _tick() {
        // 1. Increment the time by one second.
        // 2. Call printTime.
        this._incrementSeconds();
        this.printTime();
    }
    _incrementSeconds(){
        this.seconds +=1;
        if (this.seconds > 60){
            this.seconds = 0;
            this._incrementMinutes();
        }
    }
    _incrementMinutes() {
        this._incrementMinutes += 1;
        if (this.minutes > 60) {
            this.minutes = 0;
            this._incrementHours();
        }
    }
    _incrementHours() {
        this.hours = (this.hours + 1) % 24;
    }
}

const clock = new Clock();