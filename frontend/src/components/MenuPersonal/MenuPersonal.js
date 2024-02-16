import React from 'react'
import "./MenuPersonal.css"
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faFileExcel } from '@fortawesome/free-solid-svg-icons';
import 'bootstrap/dist/css/bootstrap.min.css';
import paginationFactory from 'react-bootstrap-table2-paginator';
import BootstrapTable from 'react-bootstrap-table-next';



const columns = [
    // Define tus columnas aquí
    { dataField: 'area', text: 'Área' },
    { dataField: 'cargo', text: 'Cargo' },
    { dataField: 'regimen', text: 'Regimen Laboral' },
  ];

  const data = [
    // Define tus datos aquí
    { area: 'Área 1', cargo: 'Cargo 1', regimen: 'Regimen 1' },
    { area: 'Área 2', cargo: 'Cargo 2', regimen: 'Regimen 2' },
    { area: 'Área 3', cargo: 'Cargo 3', regimen: 'Regimen 3' },
    { area: 'Área 4', cargo: 'Cargo 4', regimen: 'Regimen 4' },
    { area: 'Área 5', cargo: 'Cargo 5', regimen: 'Regimen 5' },
    { area: 'Área 6', cargo: 'Cargo 6', regimen: 'Regimen 6' },
    { area: 'Área 7', cargo: 'Cargo 7', regimen: 'Regimen 7' },
  ];

  const options = {
    sizePerPageList: [
      { text: '3', value: 3 },
      { text: '5', value: 5 },
      // Puedes ajustar las opciones según tus necesidades
    ],
  };


 

const MenuPersonal = () => {
  return (
    <div className="menu-personal">
    <body>
    <div>
    <h1 class="title-h1">Listado de personal</h1>
    </div>

    <div className='container text.center'>
    <>
    <button className="btn btn-success button-S">
        <FontAwesomeIcon icon={faFileExcel} size='2x' /> 
        </button>
    </>
    </div>
    <br/>
   

    <div className='container text-center'>
          <BootstrapTable
            keyField='id'
            data={data}
            columns={columns}
            pagination={paginationFactory(options)}
            striped
            hover
            bordered
            classes="table-custom table-shadow thead-dark" 
          />
        </div>

    </body>
    </div>

  )
}

export default MenuPersonal