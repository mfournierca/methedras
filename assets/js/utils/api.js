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

function getApiPath() {
  var id = window.location.pathname.split("/")[2]
  var dest = "http://" + window.location.host.toString() + "/api/v1/checklist/" + id
  return dest
}

const saveStateToServer = (dispatch, state) => {
  var dest = getApiPath()
  var csrf = getCSRF()

  jquery
    .ajax({
      type: "put",
      url: dest,
      data: {"data": {"data": state.data}}, // strip out the id
      dataType: "json",
      headers: {
        "X-CSRF-TOKEN": csrf
      },
      success: (data) => { dispatch({type: ACTIONS.LOG, message: "save state post done"}) },
      error: () => { dispatch({type: ACTIONS.LOG, message: "save state post fail"}) }
    });
};

const loadStateFromServer = (dispatch) => {
  var dest = getApiPath()
  var csrf = getCSRF()

  console.log("Getting checklist data: " + dest)
  jquery
    .ajax({
      type: "get",
      url: dest,
      dataType: "json",
      headers: {
        "X-CSRF-TOKEN": csrf
      },
      success: (response, code, xhr) => {

        /*
        Checklist state gets mangled by the POST method above. The array is
        converted into an object whose keys are array indices. Have to convert
        it back.
        Should be able to fix this either in the POST method above or by
        enforcing a JSON schema in postgres. The current solution is a hack.
        */
        var checklistState = xhr.responseJSON["data"]
        var items = checklistState["data"]["items"]
        checklistState["data"]["items"] = []
        for (var key in items) {
          checklistState["data"]["items"].push(items[key])
        }
        /* End hack */

        dispatch({
          type: ACTIONS.SETSTATE,
          state: {
            id: xhr.responseJSON["id"],
            data: checklistState["data"]
          }
        });
      },
      error: () => { dispatch({type: ACTIONS.LOG, message: "get state fail"}) }
    });
}

export { saveStateToServer, loadStateFromServer };