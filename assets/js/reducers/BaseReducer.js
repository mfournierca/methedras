import { ACTIONS } from "../actions/Actions"
import { socket, channel } from "../socket"

var DEFAULT_STATE = {
  meta: {},
  checklist: {
    items: [
      {
        id: "unique-id-1",
        checked: false,
        current_owner: null,
        content: "Test Item"
      }
    ]
  }
}

function BaseReducer(state=DEFAULT_STATE, action) {
  var newState = Object.assign({}, state)

  switch (action.type) {
    case ACTIONS.TOGGLECHECK:
      console.log("TOGGLE CHECK")
      newState.checklist.items[action.index].checked = !state.checklist.items[action.index].checked
    case ACTIONS.UPDATE:
      console.log("UPDATE TEXT")
      newState.checklist.items[action.index].content = action.content
  }

  return newState
}

export default BaseReducer