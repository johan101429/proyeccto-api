"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.updateArriendo = exports.deleteArriendo = exports.getArriendoByid = exports.createArriendo = exports.getArriendo = void 0;
const database_1 = require("../database");
function getArriendo(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        const conn = yield (0, database_1.connect)();
        const arriendo = yield conn.query('SELECT * FROM  arriendo');
        return res.json(arriendo[0]);
    });
}
exports.getArriendo = getArriendo;
;
function createArriendo(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        const newPost = req.body;
        const conn = yield (0, database_1.connect)();
        yield conn.query('INSERT INTO arriendo  SET?', [newPost]);
        return res.json({
            message: 'Post Created'
        });
    });
}
exports.createArriendo = createArriendo;
function getArriendoByid(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        const id = req.params.arriendoId;
        const conn = yield (0, database_1.connect)();
        const response = yield conn.query('SELECT * FROM arriendo WHERE id_arriendo = ?', [id]);
        return res.json(response[0]);
    });
}
exports.getArriendoByid = getArriendoByid;
function deleteArriendo(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        const id = req.params.arriendoId;
        const conn = yield (0, database_1.connect)();
        yield conn.query('DELETE FROM arriendo WHERE id_arriendo = ?', [id]);
        return res.json({
            message: 'arriendo delete'
        });
    });
}
exports.deleteArriendo = deleteArriendo;
function updateArriendo(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        const id = req.params.arriendoId;
        const updateArriendo = req.body;
        const conn = yield (0, database_1.connect)();
        const respuesta = yield conn.query('UPDATE arriendo set ? WHERE  id_arriendo = ?', [updateArriendo, id]);
        return res.json({
            message: 'arriendo update'
        });
    });
}
exports.updateArriendo = updateArriendo;
