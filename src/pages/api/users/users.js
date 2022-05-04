import sqlite from 'sqlite';
import sqlite3 from 'sqlite3'
import { open } from 'sqlite'

export default async function getAllUsers(req, res) {
  // const db = await sqlite.open('./schoolapp.sqlite');
  const db = await open({
    filename: './schoolapp.sqlite',
    driver: sqlite3.Database
  });
  const roles = await db.all('select * from Userrole')
  console.log(roles);
  res.json({ roles });
}
