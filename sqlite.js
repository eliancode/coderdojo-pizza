import sqlite3 from "sqlite3";
import { open } from "sqlite";
import { addPizza } from "./prisma.js";

sqlite3.verbose();

async function openDb() {
    return await open({
        filename: "./dev.db",
        driver: sqlite3.cached.Database,
    });
}

async function createTable(db) {
    await db.exec("CREATE TABLE IF NOT EXISTS tbl (col TEXT)");
}

export async function run(req, res) {
    let db = await openDb();
    console.log(db);
    createTable(db);
    res.send("Ok!");
    addPizza();
}

export default run;

addPizza();