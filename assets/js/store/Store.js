import { createStore, applyMiddleware } from 'redux'
import { routerMiddleware } from 'react-router-redux'
import thunkMiddleware from 'redux-thunk'

import reducers from "../reducers";

export default function configureStore(browserHistory) {
  const reduxRouterMiddleWare = routerMiddleware(browserHistory);

  const createStoreWithMiddleware = applyMiddleware(reduxRouterMiddleWare, thunkMiddleware)(createStore);
  const Store = createStoreWithMiddleware(reducers);

  return Store;
}
