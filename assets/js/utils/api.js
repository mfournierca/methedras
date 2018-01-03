const jquery = require("jquery")
import { ACTIONS } from "../actions/Actions"

const saveStateToServer = (dispatch, state) => {
  var dest = "http://" + window.location.host.toString() + "/checklist"
  console.log("posting to " + dest + ", csrf token: " + window.csrf_token)
  jquery
    .ajax({
      type: "post",
      url: dest,
      data: state,
      dataType: "json"
      /* headers: { } */
    })
    .fail(() => { dispatch({type: ACTIONS.LOG, message: "save state post fail"}) })
    .done(() => { dispatch({type: ACTIONS.LOG, message: "save state post done"}) })
    .always(() => { dispatch({type: ACTIONS.LOG, message: "save state post always"}) });
};

export { saveStateToServer };