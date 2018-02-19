import React, { Component } from 'react'
import { connect } from 'react-redux'
import Checklist from './Checklist'
import { ACTIONS } from '../actions/Actions'
import { saveChecklistState, saveExecutionState, loadChecklistState, loadExecutionState } from '../utils/api'
import { canEdit, canCheck } from '../utils/utils'

class ChecklistApp extends Component {

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
    onToggleCheck:    (index, value) => { console.log("Can not check item in Checklist edit mode") },
    onTextChange:     (index, content) => { dispatch({type: ACTIONS.UPDATETEXT, index: index, content: content}) },
    onNewItem:        () => { dispatch({type: ACTIONS.NEWITEM}) },
    onUpdateTitle:    (title) => { dispatch({type: ACTIONS.UPDATETITLE, title: title}) },
    onSave:           (state) => { saveChecklistState(dispatch, state) },
    loadState:        () => { loadChecklistState(dispatch) }
  }
}

const ChecklistApplication = connect(mapStateToProps, mapDispatchToProps)(ChecklistApp)

export default ChecklistApplication
