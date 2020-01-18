const reducer = (state = [], action) => {
  Object.freeze(state);
  switch(action.type) {
    case 'ADD_FRUIT':
      return [
        ...state,
        action.fruit
      ];
    case 'DELETE_FRUIT':
      const idx = state.indexOf(action.fruit);
      if(idx !==-1){
        return [...state.slice(0,idx),...state.slice(idx+1)];
      }
      return state;
    case 'CLEAR':
      return [];
    default:
      return state;
  }
};

export default reducer;
