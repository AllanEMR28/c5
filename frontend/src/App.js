import './App.css';
import React from 'react'
import BarraMenu from './components/barraMenu';
import MenuTarjetas from './components/MenuTarjetas';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import MenuPersonal from './components/MenuPersonal';
import Footer from './components/Footer';


function App() {
  return (
    <div className="App">    
    <BarraMenu/>
    <Router>
      <Routes>
        <Route path="/" element={<MenuTarjetas />} />
        <Route path="/Personal" element={<MenuPersonal />} />
        {/* Agrega más rutas según sea necesario */}
      </Routes>
    </Router>
    <Footer/>
    </div>
  );
}

export default App;
