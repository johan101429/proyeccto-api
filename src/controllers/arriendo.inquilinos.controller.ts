import { Request, Response } from "express";

import { connect } from "../database";
import { ArriendoInquilinos } from "../interface/arriendo.inquilinos.interface ";
import { promises } from "dns";

export async function getArriendoInquilinos(req: Request, res: Response): Promise<Response> {

    const conn = await connect();
    const ArriendoInquilinos = await conn.query('SELECT * FROM  arriendo');
    return res.json(ArriendoInquilinos[0])

};

export async function createArriendoInquilinos(req: Request, res: Response) {

    const newPost: ArriendoInquilinos = req.body;
    const conn = await connect();
    await conn.query('INSERT INTO arriendo_inquilinos  SET?', [newPost]);

    return res.json({
        message: 'Post Created'
    });

}

export async function getArriendoByid(req: Request, res: Response): Promise<Response> {
    const id = req.params.arriendoId;
    const conn = await connect();
    const response = await conn.query('SELECT * FROM arriendo WHERE id_arriendo = ?', [id]);
    return res.json(response[0]);

}

export async function deleteArriendo(req: Request, res: Response) {
    const id = req.params.arriendoId;
    const conn = await connect();
    await conn.query('DELETE FROM arriendo WHERE id_arriendo = ?', [id]);
    return res.json({
        message: 'arriendo delete'
    });

}

export async function updateArriendo(req: Request, res: Response) {


    const id = req.params.arriendoId;
    const updateArriendo: ArriendoInquilinos = req.body;
    const conn = await connect();
    const respuesta = await conn.query('UPDATE arriendo set ? WHERE  id_arriendo = ?', [updateArriendo, id]);
    return res.json({
        message: 'arriendo update'
    })
}