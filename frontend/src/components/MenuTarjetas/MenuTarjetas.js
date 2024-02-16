import React from 'react'
import imagen1 from './personal.jpg'
import imagen2 from './fotor-ai-20240131185434.jpg'
import imagen3 from './bajas.jpg'
import imagen4 from './registrar.jpg'
import imagen5 from './letter.jpg'
import "./MenuTarjetas.css"
import {Link, Outlet} from 'react-router-dom'
import MenuPersonal from '../MenuPersonal'

const MenuTarjetas = () => {
  return (
    <div>
    <body>
    <div>
    <h1 class="title-h1">Recursos Humanos</h1>
    <h2 class="title-h2">Bienvenido</h2>
    </div>
    

    <div class="tarjetas-contenedor">
  <div class="card">
    <img src={imagen1} alt="Imagen 1"/> 
    <div class="card-content">
      <h2 class="card-title">Listado de personal</h2>
      <p class="card-description">Listado de personal trabajador</p>
      <Link to="/Personal">
              <p class="parrafo-sub">Ver Aquí</p>
            </Link>
    </div>
     </div>
  
  <div class="card">
    <img src={imagen2} alt="Imagen 2"/>
    <div class="card-content">
      <h2 class="card-title">Listado de departamentos</h2>
      <p class="card-description">Listado de departamentos correspondientes</p>
      <p class="parrafo-sub">Ver Aquí</p>
    </div>
  </div>

  <div class="card">
    <img src={imagen3} alt="Imagen 3"/>
    <div class="card-content">
      <h2 class="card-title">Nuevo Registro</h2>
      <p class="card-description">Agregar un nuevo empleado</p>
      <p class="parrafo-sub">Ver Aquí</p>
    </div>
  </div>
  </div>

  <div class="tarjetas-contenedor">
  <div class="card">
    <img src={imagen4} alt="Imagen 4"/>
    <div class="card-content">
      <h2 class="card-title">Persona dado de baja</h2>
      <p class="card-description">Ver al personal que dejo de dar sus servicios</p>
      <p class="parrafo-sub">Ver Aquí</p>
    </div>
  </div>

  <div class="card">
    <img src={imagen5} alt="Imagen 5"/>
    <div class="card-content">
      <h2 class="card-title">Requisiciones</h2>
      <p class="card-description">Ver aquí las diferentes requisiciones obtenidas</p>
      <p class="parrafo-sub">Ver Aquí</p>
    </div>
  </div>
  </div>
  
</body>
     

     <Outlet/>
     </div>
     
  )
}

export default MenuTarjetas