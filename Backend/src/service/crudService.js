// crudService.js

// Función para consultar todos los registros de una tabla
export const obtenerTodosLosRegistros = async (modelo) => {
    try {
      const registros = await modelo.findMany();
      return registros;
    } catch (error) {
      console.error(`Error al intentar obtener todos los registros: ${error.message}`);
      // No detendremos la aplicación, simplemente devolveremos un arreglo vacío
      return null;
    }
  };
  
  // Función genérica para crear un registro
  export const crearRegistro = async (modelo, datos) => {
    try {
      const nuevoRegistro = await modelo.create({
        data: datos
      });
      return nuevoRegistro;
    } catch (error) {
      console.error(`Error al crear el registro: ${error.message}`);
      // No detendremos la aplicación, simplemente devolveremos null
      return null;
    }
  };
  
  // Función genérica para obtener un registro por ID
  export const obtenerRegistroPorId = async (modelo, id) => {
    try {
      const registro = await modelo.findUnique({
        where: {
          id: id,
        },
      });
      return registro;
    } catch (error) {
      console.error(`Error al obtener el registro por ID: ${error.message}`);
      // No detendremos la aplicación, simplemente devolveremos null
      return null;
    }
  };
  
  // Función genérica para eliminar un registro por ID
  export const eliminarRegistroPorId = async (modelo, id) => {
    try {
      const registroExistente = await obtenerRegistroPorId(modelo, id);
  
      if (registroExistente) {
        const registroEliminado = await modelo.delete({
          where: {
            id: id,
          },
        });
        return registroEliminado;
      } else {
        console.log('La entidad no existe, no se puede eliminar.');
        return null;
      }
    } catch (error) {
      console.error(`Error al intentar eliminar el registro por ID: ${error.message}`);
      // No detendremos la aplicación, simplemente devolveremos null
      return null;
    }
  };
  