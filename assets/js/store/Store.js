import { createStore, applyMiddleware } from 'redux'
import { routerMiddleware } from 'react-router-redux'
import thunkMiddleware from 'redux-thunk'

import reducers from "../reducers/Reducer";

export default function configureStore(browserHistory) {
  const reduxRouterMiddleWare = routerMiddleware(browserHistory);
  const createStoreWithMiddleware = applyMiddleware(reduxRouterMiddleWare, thunkMiddleware)(createStore);
  return createStoreWithMiddleware(reducers);
}
