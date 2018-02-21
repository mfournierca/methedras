import { connect } from 'react-redux'
import { ACTIONS } from '../../actions/Actions'
import { saveChecklistState, saveExecutionState, loadChecklistState, loadExecutionState } from '../../utils/api'
import BaseApplication from './BaseApplication'

class ExecuteApplication extends BaseApplication {
}

const mapStateToProps = (state) => {
  return {
    state: state
  }
}

const mapDispatchToProps = (dispatch) => {
  return {
    onToggleCheck:    (index, value) => { dispatch({type: ACTIONS.TOGGLECHECK, index: index, value: value}) },
    onTextChange:     (index, content) => { console.log("Cannot edit item in execute mode") },
    onNewItem:        () => { console.log("Cannot add item in execute mode") },
    onUpdateTitle:    (title) => { console.log("Cannot edit title in execute mode") },
    onSave:           (state) => { saveExecutionState(dispatch, state) },
    loadState:        (execution_id) => { loadExecutionState(dispatch, execution_id) }
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(ExecuteApplication)
