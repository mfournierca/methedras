import React, { Component } from 'react'
import { connect } from 'react-redux'
import Checklist from './Checklist'
import { ACTIONS } from '../actions/Actions'

class App extends Component {
  render() {

    const {
      state,
      onToggleCheck,
      onTextChange,
      onNewItem
    } = this.props;

    return (
      <div>
        <h2>Application</h2>
        <Checklist
          state={ state.checklist }
          onToggleCheck={ onToggleCheck }
          onTextChange={ onTextChange }
          onNewItem={ onNewItem }
        />
      </div>
    );
  }
}

const mapStateToProps = (state) => {
  return {
    state: state
  }
}

const mapDispatchToProps = (dispatch) => {
  return {
    onToggleCheck: (index) => { dispatch({type: ACTIONS.TOGGLECHECK, index: index}) },
    onTextChange: (index, content) => { dispatch({type: ACTIONS.UPDATETEXT, index: index, content: content}) },
    onNewItem: () => { dispatch({type: ACTIONS.NEWITEM}) }
  }
}

const Application = connect(mapStateToProps, mapDispatchToProps)(App)

export default Application