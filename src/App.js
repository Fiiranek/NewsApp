import React from 'react';
import './App.css';
import firebase from './Firebase'
import AddNews from './components/AddNews'
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Link,
  Redirect
} from 'react-router-dom';
import ZycieMiastaNews from './components/ZycieMiastaNews'
import KomunikacjaNews from './components/KomunikacjaNews'
import BiznesNews from './components/BiznesNews'
import SportNews from './components/SportNews'
import KulturaNews from './components/KulturaNews'
import DzielniceNews from './components/DzielniceNews'

function App() {
  return (
    <Router>
      <div className="App">
        <h2>Dodaj wiadomość</h2>
        <AddNews />
        <ul className="nav">
          <li className="nav-item">
            <Link className="nav-link" to="/zycie-miasta">Życie miasta</Link>
          </li>
          <li className="nav-item">
            <Link className="nav-link" to="/komunikacja">Komunikacja</Link>
          </li>
          <li className="nav-item">
            <Link className="nav-link" to="/biznes">Biznes</Link>
          </li>
          <li className="nav-item">
            <Link className="nav-link" to="/sport">Sport</Link>
          </li>
          <li className="nav-item">
            <Link className="nav-link" to="/kultura">Kultura</Link>
          </li>
          <li className="nav-item">
            <Link className="nav-link" to="/zdzielnice">Dzielnice</Link>
          </li>
        </ul>
        <Switch>
          <Route exact path="/" render={() => (
            <Redirect to="/zycie-miasta" />
          )} />
          <Route path="/zycie-miasta" component={(props) => <ZycieMiastaNews />} />
          <Route path="/komunikacja" component={(props) => <KomunikacjaNews />} />
          <Route path="/biznes" component={(props) => <BiznesNews />} />
          <Route path="/sport" component={(props) => <SportNews />} />
          <Route path="/kultura" component={(props) => <KulturaNews />} />
          <Route path="/dzielnice" component={(props) => <DzielniceNews />} />
        </Switch>
      </div>
    </Router>
  );
}

export default App;
