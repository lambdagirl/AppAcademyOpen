//Utility code, especially vector math stuff.
const Util= {
    inherits(ChildClass,ParentClass){
        //...
        ChildClass.prototype = Object.create(ParentClass.prototype);
        ChildClass.prototype.constructor = ChildClass;
    };
};

module.exports = Util;
