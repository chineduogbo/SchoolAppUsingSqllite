const sqlite = require('sqlite');
const sqlite3 = require('sqlite3');

async function setup() {
  const db = await sqlite.open({
    filename: './schoolapp.sqlite',
    driver: sqlite3.Database,
  });

  await db.migrate({
    force: true,
    migrationsPath: './migrations/'
  });

  const role = await db.all('SELECT * FROM Userrole');
  console.log('roles', JSON.stringify(role, null, 2));
}

setup();


// const sqlite = require('sqlite');
// const sqlite3 = require('sqlite3')
// const { open } = require('sqlite')

// async function openDB() {
//   return open({
//     filename: './schoolapp.sqlite',
//     driver: sqlite3.Database
//   })
// }


// async function setup() {
//   const db = await openDB();
//   //await db.migrate({ force: 'last' });
//   await db.migrate({
//     force: 'last', migrationsPath: "./migrations/001-initial.sql"
//   })
// }

// setup();
