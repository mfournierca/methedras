import { ACTIONS } from "../actions/Actions"

import { socket, channel } from "../socket"
static DEFAULT_STATE = {
  meta: {},
  checklist: {
    items: [
      {
        id: 1,
        checked: false,
        current_owner: nil,
        content: "Test Item"
      }
    ]
  }
}

function BaseReducer(state=DEFAULT_STATE, action) {
  return state
}

export default BaseReducer