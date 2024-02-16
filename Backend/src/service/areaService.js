import { areaModel} from '../models/areaModelo.js';
import { crudService } from '../service/index.js';


export const obtenerArea = async () => {
  return crudService.obtenerTodosLosRegistros(areaModel)
}
