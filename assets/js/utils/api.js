const jquery = require("jquery")
import { ACTIONS } from "../actions/Actions"

function getCSRF() {
  var csrf = null
  var meta_tags = document.getElementsByTagName("meta")
  for (var i = 0; i < meta_tags.length; i++) {
    if (meta_tags[i].getAttribute("name") == "csrf-token") {
      csrf = meta_tags[i].getAttribute("content")
      break
    }
  }
  return csrf
}

const saveStateToServer = (dispatch, state) => {
  var dest = "http://" + window.location.host.toString() + "/checklist"
  var csrf = getCSRF()

  jquery
    .ajax({
      type: "post",
      url: dest,
      data: {"checklist": {"data": state.checklist}},
      dataType: "json",
      headers: {
        "X-CSRF-TOKEN": csrf
      },
      success: (data) => { dispatch({type: ACTIONS.LOG, message: "save state post done"}) },
      error: () => { dispatch({type: ACTIONS.LOG, message: "save state post fail"}) }
    });
};

const loadStateFromServer = (dispatch) => {
  var id = window.location.pathname.split("/")[2]
  var dest = "http://" + window.location.host.toString() + "/checklist/" + id + "/data"
  var csrf = getCSRF()

  console.log("Getting checklist data: " + dest)
  jquery
    .ajax({
      type: "get",
      url: dest,
      headers: {
        "X-CSRF-TOKEN": csrf
      },
      success: (data) => { dispatch({type: ACTIONS.LOG, message: "get state success"}) },
      error: () => { dispatch({type: ACTIONS.LOG, message: "get state fail"}) }
    });
}

export { saveStateToServer, loadStateFromServer };