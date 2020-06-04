//Utility code, especially vector math stuff.
const Util= {
    inherits(ChildClass,ParentClass){
        //...
        ChildClass.prototype = Object.create(ParentClass.prototype);
        ChildClass.prototype.constructor = ChildClass;
    },
    //return a randomly oriented vector with given length
    randomVec(length){
        const deg = 2*Math.PI*  Math.random();
        return Util.scale([Math.sin(deg), Math.cos(deg)], length);
    },

    scale(vec,m){
        return [vec[0]*m, vec[1] * m];
    }
};

module.exports = Util;
