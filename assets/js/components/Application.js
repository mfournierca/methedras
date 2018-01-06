import React, { Component } from 'react'
import { connect } from 'react-redux'
import Checklist from './Checklist'
import { ACTIONS } from '../actions/Actions'
import { saveStateToServer, loadStateFromServer } from '../utils/api'

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

    if (!(state.meta === undefined || state.meta.loading === undefined) && state.meta.loading) {
      return (
        <div>Loading ... </div>
      );
    } else {
      return (
        <div>
          <h2>Application</h2>
          <Checklist
            state={ state }
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
    onTextChange:     (index, content) => { dispatch({type: ACTIONS.UPDATETEXT, index: index, content: content}) },
    onNewItem:        () => { dispatch({type: ACTIONS.NEWITEM}) },
    onUpdateTitle:    (title) => { dispatch({type: ACTIONS.UPDATETITLE, title: title}) },
    onSave:           (state) => { saveStateToServer(dispatch, state) },
    loadState:        () => { loadStateFromServer(dispatch) }
  }
}

const Application = connect(mapStateToProps, mapDispatchToProps)(App)

export default Application