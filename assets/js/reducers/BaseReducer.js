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
      },
      {
        id: "unique-id-2",
        checked: true,
        current_owner: null,
        content: "Test Item 2"
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
    case ACTIONS.UPDATETEXT:
      console.log("UPDATE TEXT")
      newState.checklist.items[action.index].content = action.content
    case ACTIONS.NEWITEM:
      var item = {
        id: "item-" + Math.random()*10000000,
        checked: false,
        current_owner: null,
        content: "New Item"
      }
      newState.checklist.items.push(item)
  }

  return newState
}

export default BaseReducer