const jquery = require("jquery")
import { ACTIONS } from "../actions/Actions"

const saveStateToServer = (dispatch, state) => {
  var dest = "http://" + window.location.host.toString() + "/checklist"

  var csrf = null
  var meta_tags = document.getElementsByTagName("meta")
  for (var i = 0; i < meta_tags.length; i++) {
    if (meta_tags[i].getAttribute("name") == "csrf-token") {
      csrf = meta_tags[i].getAttribute("content")
      break
    }
  }

  jquery
    .ajax({
      type: "post",
      url: dest,
      data: state,
      dataType: "json",
      headers: {
        "X-CSRF-TOKEN": csrf
      }
    })
    .fail(() => { dispatch({type: ACTIONS.LOG, message: "save state post fail"}) })
    .done(() => { dispatch({type: ACTIONS.LOG, message: "save state post done"}) })
    .always(() => { dispatch({type: ACTIONS.LOG, message: "save state post always"}) });
};

export { saveStateToServer };