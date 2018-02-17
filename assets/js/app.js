// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"

import React                      from 'react';
import { render }                 from 'react-dom';

import { browserHistory }         from 'react-router';
import { syncHistoryWithStore }   from 'react-router-redux';

import Application                from './components/Application';
import configureStore             from './store/Store';

const store = configureStore(browserHistory);
const history = syncHistoryWithStore(browserHistory, store);

const target = document.getElementById("react-application-root");
const node = <Root routerHistory={ history } store={ store }/>;

render(node, target);
