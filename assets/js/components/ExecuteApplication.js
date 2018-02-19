import React, { Component } from 'react'
import { connect } from 'react-redux'
import Checklist from './Checklist'
import { ACTIONS } from '../actions/Actions'
import { saveChecklistState, saveExecutionState, loadChecklistState, loadExecutionState } from '../utils/api'
import { canEdit, canCheck } from '../utils/utils'

class ExecuteApp extends Component {

  componentDidMount() {
    this.props.loadState()
  }

  render() {

    const {
      state,
      match,
      onToggleCheck,
      onTextChange,
      onNewItem,
      onUpdateTitle,
      onSave
    } = this.props;

    console.log("routerMatch: " + JSON.stringify(match));

    if (!(state === undefined || state.loading === undefined) && state.loading) {
      return (
        <div>Loading ... </div>
      );
    } else {
      return (
        <div>
          <h2>Application</h2>
          <Checklist
            state={ state.checklist }
            onToggleCheck={ onToggleCheck }
            onTextChange={ onTextChange }
            onNewItem={ onNewItem }
            onUpdateTitle={ onUpdateTitle }
            onSave={ onSave }
          />
        </div>
      );
    }
  }
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
    loadState:        () => { loadExecutionState(dispatch) }
  }
}

const ExecuteApplication = connect(mapStateToProps, mapDispatchToProps)(ExecuteApp)

export default ExecuteApplication
