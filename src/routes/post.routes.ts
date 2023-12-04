import { Router } from "express";
const router = Router();

import { getArriendo,createArriendo,getArriendoByid, deleteArriendo,updateArriendo } from '../controllers/arriendo.controller';

// 
router.route('/')
    .get(getArriendo)
    .post(createArriendo);



router.route('/:arriendoId')

.get(getArriendoByid)
.delete(deleteArriendo)
.put(updateArriendo)




export default router;