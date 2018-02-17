import { combineReducers }  from 'redux';
import { routerReducer }    from 'react-router-redux';
import BaseReducer          from './BaseReducer';

export default combineReducers({
  routing: routerReducer,
  base: BaseReducer
});