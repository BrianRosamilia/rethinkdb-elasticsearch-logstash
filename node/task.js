r = require('rethinkdb')

r.connect({ host: 'rethinkdb', port: 28015 }, function(err, conn) {
  if(err) throw err;
  r.db('test').tableCreate('articles').run(conn, function(err, res) {
    if(err) throw err;
    console.log(res);
    process.exit(0);
  });
});