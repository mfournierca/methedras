import { createStore, applyMiddleware } from 'redux'
import { routerMiddleware } from 'react-router-redux'
import thunkMiddleware from 'redux-thunk'

import BaseReducer from "../reducers/BaseReducer"

export default function configureStore(browserHistory) {
  const reduxRouterMiddleWare = routerMiddleware(browserHistory);

  const createStoreWithMiddleware = applyMiddleware(reduxRouterMiddleWare, thunkMiddleware)(createStore);
  const Store = createStoreWithMiddleware(BaseReducer);

  return Store;
}
