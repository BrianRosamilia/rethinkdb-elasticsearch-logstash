# RethinkDB + Logstash + Elasticsearch Vagrant Box

An example base vagrant box that indexes RethinkDB documents with Elasticsearch via Logstash (applications run as docker containers)

'vagrant up' will provision the following :

* [cAdvisor](https://github.com/google/cadvisor)
* [RethinkDB](https://www.rethinkdb.com/) running on 28015/29015 with its admin UI on 8081
* [Elasticsearch](https://www.elastic.co/products/elasticsearch) running on 9200
* Creates table 'articles' in database 'test'.  
* Configures [logstash](https://www.elastic.co/products/logstash) + [rethinkdb-elasticsearch-logstash logstash plugin](https://github.com/BrianRosamilia/rethinkdb-elasticsearch-logstash.git) (watching the 'test.articles' table)

## Example

Download this repository as a Zip file.

`C:\rethinkdb-elasticsearch-logstash>` `vagrant up`

Insert a record via the admin UI (http://localhost:8081/#dataexplorer)

`r.db('test').table('articles').insert({ subject : 'GeoJSON and MongoDB', body : 'test body' });`

Then navigate to 

http://localhost:9200/_search?q=mongodb

You should see a response + relevance score!
