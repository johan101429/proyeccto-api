"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const router = (0, express_1.Router)();
const arriendo_controller_1 = require("../controllers/arriendo.controller");
// 
router.route('/')
    .get(arriendo_controller_1.getArriendo)
    .post(arriendo_controller_1.createArriendo);
router.route('/:arriendoId')
    .get(arriendo_controller_1.getArriendoByid)
    .delete(arriendo_controller_1.deleteArriendo)
    .put(arriendo_controller_1.updateArriendo);
exports.default = router;
