export const addOrange = {
  type: 'ADD_FRUIT',
  fruit: 'orange'
};

export const addApple = {
  type: 'ADD_FRUIT',
  fruit: 'apple'
};

export const addFruit =(fruits)=> {
  return {
    type: 'ADD_FRUIT',
    fruit:fruits
  }
}

export const deleteFruit =(fruits)=>{
  return {
    type: 'DELETE_FRUIT',
    fruit:fruits
  }
}
export const clear = {
  type:'CLEAR',
  
}