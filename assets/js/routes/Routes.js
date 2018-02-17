import { IndexRoute, Route }          from 'react-router';
import React                          from 'react';
import Application                    from '../components/Application';

export default function configRoutes() {

  return (
    <Route path='/:id' component={ Application }>
    </Route>
  );
}