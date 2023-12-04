import { Router } from "express";
const router = Router();

import { getArriendoInquilinos,createArriendoInquilinos,getArriendoByid, deleteArriendo,updateArriendo } from '../controllers/arriendo.inquilinos.controller';

// 
router.route('/')
    .get(getArriendoInquilinos)
    .post(createArriendoInquilinos);



router.route('/:arriendoId')

.get(getArriendoByid)
.delete(deleteArriendo)
.put(updateArriendo)




export default router;