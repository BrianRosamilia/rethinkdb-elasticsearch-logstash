docker network create --driver bridge rethinkElastic

docker build -t my/rethinkdb /vagrant/rethinkdb

docker run -itd --net-alias=rethinkdb --net=rethinkElastic -p 8081:8081 -p 28015:28015 -p 29015:29015 my/rethinkdb

docker build -t my/node /vagrant/node 

docker run -itd --net=rethinkElastic my/node 

docker run -itd --net-alias=elasticsearch --net=rethinkElastic  -p 9200:9200 -p 9300:9300 elasticsearch

docker build -t my/logstash /vagrant/logstash

docker run -itd --net=rethinkElastic  my/logstash logstash -e 'input {
rethinkdb
   {
    host => "rethinkdb"
    port => 28015
    auth_key => ""
    watch_dbs => [""]
    watch_tables => ["articles"]
    backfill => true
   }
}
output {
elasticsearch{
    hosts => "elasticsearch:9200"
    }
}'