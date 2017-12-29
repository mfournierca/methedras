import { createStore, applyMiddleware } from 'redux'
import thunkMiddleware from 'redux-thunk'

import BaseReducer from "../reducers/BaseReducer"

const createStoreWithMiddleware = applyMiddleware(thunkMiddleware)(createStore)
const Store = createStoreWithMiddleware(BaseReducer)
export default Store