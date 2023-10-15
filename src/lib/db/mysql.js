import mysql from "mysql2/promise";
let mysqlconn = null;

export function dbConnect() {
    if (!mysqlconn) {
        // used for development with MAMP
        // mysqlconn = mysql.createConnection({
        //   host: "127.0.0.1",
        //   user: "root",
        //   password: "",
        //   database: "statedata",
        // });
        mysqlconn = mysql.createConnection(process.env.DB_URL);
    }

    return mysqlconn;
}