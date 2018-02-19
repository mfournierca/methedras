import { IndexRoute, Route }          from 'react-router';
import React                          from 'react';
import ChecklistApplication                    from '../components/ChecklistApplication';
import ExecuteApplication                    from '../components/ExecuteApplication';

export default function configRoutes() {

  // This has to stay in sync with the phoenix routes.

  return (
    <div>
      <Route path='/checklist' component={ ChecklistApplication } />
      <Route path='/execute' component={ ExecuteApplication } />
    </div>
  );
}