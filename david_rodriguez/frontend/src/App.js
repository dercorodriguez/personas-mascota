import React from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import Persona from './pages/persona';
import Mascota from './pages/mascota';
import Home from './pages/inicio';

function App() {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/persona" element={<Persona />} />
        <Route path="/mascota" element={<Mascota />} />
      </Routes>
    </Router>
  );
}

export default App;
