import { IndexRoute, Route }          from 'react-router';
import React                          from 'react';
import ChecklistApplication                    from '../components/ChecklistApplication';
import ExecuteApplication                    from '../components/ExecuteApplication';

export default function configRoutes() {

  // This has to stay in sync with the phoenix routes.

  return (
    <div>
      <Route path='/checklist/:id' component={ ChecklistApplication } />
      <Route path='/execute/:id' component={ ExecuteApplication } />
    </div>
  );
}