import React from "react";

class Calculator extends React.Component {
    constructor(props){
        super(props);
        this.state ={
            num1:"",
            num2:"",
            result:0
        }
        this.setNumber1 = this.setNumber1.bind(this)
        this.setNumber2 = this.setNumber2.bind(this)
        this.adding = this.adding.bind(this)
        this.subtracting = this.adding.bind(this)
        this.multiplying = this.multiplying.bind(this)
        this.dividing = this.dividing.bind(this)
        this.reset = this.reset.bind(this)

    }
    setNumber1(e){
        this.setState({num1:e.target.value})
    }
    setNumber2(e){
        this.setState({num2:e.target.value})
    }
    adding(e){
        e.preventDefault()
        const {num1, num2} = this.state
        this.setState({result:Number(num1)+Number(num2)})
    }
    subtracting(e){
        e.preventDefault()
        const {num1, num2} = this.state 
        this.setState({result:Number(num1)-Number(num2)})
    }
    multiplying(e){
        e.preventDefault()
        const {num1, num2} = this.state 
        this.setState({result:Number(num1)*Number(num2)})
    }
    dividing(e){
        e.preventDefault()
        const {num1, num2} = this.state 
        this.setState({result:Number(num1)/Number(num2)})
    }
    reset(e){
        e.preventDefault()
        this.setState({result:0,
            num1:"",
            num2:""})
    }
    render (){
        const {num1,num2,result} = this.state
        return (
            <div>
            <input onChange={this.setNumber1} value={num1}></input>
            <input onChange={this.setNumber2} value={num2}></input>
            <br />
            <button onClick={this.adding}>+</button>
            <button onClick={this.subtracting}>-</button>
            <button onClick={this.multiplying}>x</button>
            <button onClick={this.dividing}>/</button>
            <button onClick={this.reset}>reset</button>
            <h1>{result}</h1>
            </div>
        )
    }
}
export default Calculator;