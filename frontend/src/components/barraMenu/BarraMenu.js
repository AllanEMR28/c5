import logo from './C5DGOAZUL.png'
import React from 'react'
import "./BarraMenu.css"
const BarraMenu = () => {
  return (
    <header>  
        <a href="#">
    <img src={logo} alt="logotipoc5"/>
    </a>
    <nav>
      <ul>
        <li><a href="#">Departamentos</a></li>
        <li>
          <a href="#">Personal</a>
          
          <div class="submenu">
            <a href="#">Requisiciones</a>
          </div>
        </li>
        <li><a href="#">Registros</a></li>
        <li><a href="#">Vacantes</a></li>
      </ul>
    </nav>
   </header>
  )
}

export default BarraMenu

