import React, { Component } from 'react'
import Checklist from './Checklist'

export default class BaseApp extends Component {

  componentDidMount() {
    // match is passed in from the router.
    this.props.loadState(this.props.match.params.id)
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
