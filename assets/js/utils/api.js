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

function getChecklistApiPath(id) {
  return "http://" + window.location.host.toString() + "/api/v1/checklist/" + id
}

function getExecutionApiPath(id) {
  return "http://" + window.location.host.toString() + "/api/v1/execution/" + id
}

function put(url, data, onSuccess, onError) {
  var csrf = getCSRF()

  console.log("PUT data: " + url)
  jquery
    .ajax({
      type: "put",
      url: url,
      data: data,
      dataType: "json",
      headers: {
        "X-CSRF-TOKEN": csrf
      },
      success: onSuccess,
      error: onError
    });
}

function get(url, onSuccess, onError) {
  var csrf = getCSRF()

  console.log("GET data: " + url)
  jquery
    .ajax({
      type: "get",
      url: url,
      dataType: "json",
      headers: {
        "X-CSRF-TOKEN": csrf
      },
      success: onSuccess,
      error: onError
    });
}

function unWindChecklistState(checklistState) {
    /*
    Checklist state gets mangled by the method above. The items array is
    converted into an object whose keys are array indices. Have to convert
    it back.
    Should be able to fix this either in the POST method above or by
    enforcing a JSON schema in postgres. The current solution is a hack.
    */
    var items = checklistState["data"]["items"]
    checklistState["data"]["items"] = []
    for (var key in items) {
      checklistState["data"]["items"].push(items[key])
    }
    /* End hack */
    return checklistState;
}

const saveChecklistState = (dispatch, state) => {
  var dest = getChecklistApiPath()
  put(
    dest,
    {"data": {"data": state.data}}, // strip out the id
    (data) => { dispatch({type: ACTIONS.LOG, message: "save state post done"}) },
    () => { dispatch({type: ACTIONS.LOG, message: "save state post fail"}) }
  )
};

const saveExecutionState = (dispatch, state) => {
  var dest = getExecutionApiPath()
  put(
    dest,
    {"execution": {"data": state.data}}, // strip out ids
    (data) => { dispatch({type: ACTIONS.LOG, message: "save execution state done"}) },
    () => { dispatch({type: ACTIONS.LOG, message: "save execution state fail"}) }
  );
}

const loadChecklistState = (dispatch, id) => {
  var dest = getChecklistApiPath(id)
  get(
    dest,
    (response, code, xhr) => {
      var checklistState = unWindChecklistState(xhr.responseJSON["data"])
      dispatch({
        type: ACTIONS.SETSTATE,
        state: {
          id: checklistState["id"],
          data: checklistState["data"]
        }
      });
    },
    () => { dispatch({type: ACTIONS.LOG, message: "get state fail"}) }
  );
}

const loadExecutionState = (dispatch, id) => {
  var dest = getExecutionApiPath(id)
  get(
    dest,
    (response, code, xhr) => {
      var executionState = unWindChecklistState(xhr.responseJSON["data"])
      dispatch({
        type: ACTIONS.SETSTATE,
        state: {
          id: executionState["id"],
          data: executionState["data"]
        }
      });
    },
    () => { dispatch({type: ACTIONS.LOG, message: "get state fail"}) }
  );
}

export { saveChecklistState, saveExecutionState, loadChecklistState, loadExecutionState };