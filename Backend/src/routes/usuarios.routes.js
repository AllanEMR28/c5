import { Router } from 'express';
import { usuarioServices } from '../service/index.js'


const router = Router();

router.get('/usuarios', (req, res) => {
    res.send('Hola desde usuariosRouter')
})


//Ruta para agregar un usuario 
router.post('/agregar', async (req, res) => {
    try {
        const nuevoUsuario = await usuarioServices.crearUsuario(req.body)
        res.status(200).json({
            success: true,
            data: nuevoUsuario
        })
    } catch (error) {
        res.status(500).json({
            success: false,
            mensaje: "Error al crear nuevo usuario",
            error: error.message
        })
    }
})

//ruta para eliminar un usuario
router.delete('/eliminar/:id', async (req, res) => {
    const id = parseInt(req.params.id)
    try {
        const usuarioEliminado = await usuarioServices.eliminarUsuario(id)

        const respuesta = usuarioEliminado === null ? {
            success: false,
            mensaje: `Error al eliminar el usuario ${id}`,
            error: 'No se pudo completar la eliminación.',
            status: 500,
        }
            :
            usuarioEliminado === true
                ? {
                    success: false,
                    mensaje: `La entidad con ID ${id} no existe, no se puede eliminar.`,
                    error: null,
                    status: 404,
                }
                : {
                    success: true,
                    data: usuarioEliminado,
                    status: 200,
                };
        res.status(respuesta.status).json(respuesta);
    } catch (error) {
        res.status(500).json({
            success: false,
            mensaje: "Error al crear nuevo usuario",
            error: error.message
        })
    }
})

router.get('/obtenerTodo', async (req,res) => { 

    try {
        const obtenerUsuarios = await usuarioServices.obtenerUsuarios()
        res.status(200).json({
            success: true,
            data: obtenerUsuarios
        })
    } catch (error) {
        res.status(500).json({
            success: false,
            mensaje: "Error al crear nuevo usuario",
            error: error.message
        })
    }
})

router.get('/obtener/:id', async (req,res) => { 
    
    const id = parseInt(req.params.id) 

    try {
        const obtenerUsuario = await usuarioServices.obtenerUsuario(id)
        res.status(200).json({
            success: true,
            data: obtenerUsuario
        })
    } catch (error) {
        res.status(500).json({
            success: false,
            mensaje: "Error al crear nuevo usuario",
            error: error.message
        })
    }
})




export default router;