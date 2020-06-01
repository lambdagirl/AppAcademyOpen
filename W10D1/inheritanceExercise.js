Function.prototype.inherits = function(BaseClass){
    function Surrogate(){}
    Surrogate.prototype = BaseClass.prototype;
}
