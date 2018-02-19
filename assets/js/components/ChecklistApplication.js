import { connect } from 'react-redux'
import { ACTIONS } from '../actions/Actions'
import { saveChecklistState, saveExecutionState, loadChecklistState, loadExecutionState } from '../utils/api'
import BaseApplication from './BaseApplication'

class ChecklistApplication extends BaseApplication {
}

const mapStateToProps = (state) => {
  return {
    state: state
  }
}

const mapDispatchToProps = (dispatch) => {
  return {
    onToggleCheck:    (index, value) => { console.log("Can not check item in Checklist edit mode") },
    onTextChange:     (index, content) => { dispatch({type: ACTIONS.UPDATETEXT, index: index, content: content}) },
    onNewItem:        () => { dispatch({type: ACTIONS.NEWITEM}) },
    onUpdateTitle:    (title) => { dispatch({type: ACTIONS.UPDATETITLE, title: title}) },
    onSave:           (state) => { saveChecklistState(dispatch, state) },
    loadState:        (checklist_id) => { loadChecklistState(dispatch, checklist_id) }
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(ChecklistApplication)
