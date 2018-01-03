import { ACTIONS } from "../actions/Actions"
import { socket, channel } from "../socket"

var DEFAULT_STATE = {
  meta: {},
  checklist: {
    title: "New Checklist",
    items: [
      {
        id: "unique-id-1",
        checked: false,
        current_owner: null,
        content: "Add checklist item text here."
      },
      {
        id: "unique-id-2",
        checked: true,
        current_owner: null,
        content: "You can add multiple items."
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
      break

    case ACTIONS.UPDATETEXT:
      console.log("UPDATE TEXT")
      newState.checklist.items[action.index].content = action.content
      break

    case ACTIONS.NEWITEM:
      var item = {
        id: "item-" + Math.random()*10000000,
        checked: false,
        current_owner: null,
        content: "New Item"
      }
      newState.checklist.items.push(item)
      break

    case ACTIONS.UPDATETITLE:
      newState.checklist.title = action.title
      break

    case ACTIONS.LOG:
      console.log(action.message)
      break
  }

  return newState
}

export default BaseReducer