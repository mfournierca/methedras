import React, { Component } from 'react'
import { connect } from 'react-redux'
import Checklist from './Checklist'
import { ACTIONS } from '../actions/Actions'
import { saveChecklistState, saveExecutionState, loadChecklistState, loadExecutionState } from '../utils/api'
import { canEdit, canCheck } from '../utils/utils'

class App extends Component {

  componentDidMount() {
    this.props.loadState()
  }

  render() {
    const {
      state,
      onToggleCheck,
      onTextChange,
      onNewItem,
      onUpdateTitle,
      onSave
    } = this.props;

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

  if (!canCheck() && canEdit) {
    return {
      onToggleCheck:    (index, value) => { console.log("canCheck flag is false, cannot check item") },
      onTextChange:     (index, content) => { dispatch({type: ACTIONS.UPDATETEXT, index: index, content: content}) },
      onNewItem:        () => { dispatch({type: ACTIONS.NEWITEM}) },
      onUpdateTitle:    (title) => { dispatch({type: ACTIONS.UPDATETITLE, title: title}) },
      onSave:           (state) => { saveChecklistState(dispatch, state) },
      loadState:        () => { loadChecklistState(dispatch) }
    }
  } else if (canCheck() && !canEdit()) {
    return {
      onToggleCheck:    (index, value) => { dispatch({type: ACTIONS.TOGGLECHECK, index: index, value: value}) },
      onTextChange:     (index, content) => { console.log("canEdit is false, cannot edit text") },
      onNewItem:        () => { console.log("canEdit is false, cannot add new item") },
      onUpdateTitle:    (title) => { console.log("canEdit is false, cannot edit title") },
      onSave:           (state) => { saveExecutionState(dispatch, state) },
      loadState:        () => { loadExecutionState(dispatch) }
    }
  } else {
    console.log("Invalid url path state")
  }
}

const Application = connect(mapStateToProps, mapDispatchToProps)(App)

export default Application