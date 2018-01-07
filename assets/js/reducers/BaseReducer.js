import { ACTIONS } from "../actions/Actions"
import { socket, channel } from "../socket"
import { canEdit, canCheck } from "../utils/utils"

var DEFAULT_STATE = {
  id: "unique-checklist-id",
  loading: true,
  data: {
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

  console.log(JSON.stringify(action))

  switch (action.type) {
    case ACTIONS.TOGGLECHECK:
      if (canCheck()) {
        newState.data.items[action.index].checked = action.value
      } else {
        console.log("Not on a checkable path, cannot check item")
      }
      break

    case ACTIONS.UPDATETEXT:
      if (canEdit()) {
        newState.data.items[action.index].content = action.content
      } else {
        console.log("Not on an editable path, cannot edit item")
      }
      break

    case ACTIONS.NEWITEM:
      if (canEdit()) {
        var item = {
          id: "item-" + Math.random()*10000000,
          checked: false,
          current_owner: null,
          content: "New Item"
        }
        newState.data.items.push(item)
      } else {
        console.log("Not on an editable path, cannot add item")
      }
      break

    case ACTIONS.UPDATETITLE:
      if (canEdit()) {
        newState.data.title = action.title
      } else {
        console.log("Not on an editable path, cannot edit title")
      }
      break

    case ACTIONS.LOG:
      console.log(action.message)
      break

    case ACTIONS.SETSTATE:
      return action.state
  }

  return newState
}

export default BaseReducer