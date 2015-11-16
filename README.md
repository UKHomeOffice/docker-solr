# Solr Docker Container

[![Build Status](https://travis-ci.org/UKHomeOffice/docker-solr.svg)](https://travis-ci.org/UKHomeOffice/docker-solr) [![GitHub version](https://badge.fury.io/gh/ukhomeoffice%2Fdocker-solr.svg)](https://badge.fury.io/gh/ukhomeoffice%2Fdocker-solr) [![Docker Repository on Quay.io](https://quay.io/repository/ukhomeofficedigital/solr/status "Docker Repository on Quay.io")](https://quay.io/repository/ukhomeofficedigital/solr)

This is a docker container for [Solr](http://lucene.apache.org/solr/).



## Getting Started

These instructions will cover usage information and for the docker container 

### Prerequisites


In order to run this container you'll need docker installed.

* [Windows](https://docs.docker.com/windows/started)
* [OS X](https://docs.docker.com/mac/started/)
* [Linux](https://docs.docker.com/linux/started/)

### Usage

#### Container Parameters

To run a single Solr server:

```shell
docker run --name my_solr -d -p 8983:8983 -t quay.io/ukhomeofficedigital/solr:$CONTAINER_VERSION
```

Then with a web browser go to `http://localhost:8983/` to see the Admin Console (adjust the hostname for your docker host).

To use Solr, you need to create a "core", an index for your data. For example:

```shell
docker exec -it --user=solr my_solr bin/solr create_core -c gettingstarted
```

In the web UI if you click on "Core Admin" you should now see the "gettingstarted" core.

If you want to load some example data:

```shell
docker exec -it --user=solr my_solr bin/post -c gettingstarted example/exampledocs/manufacturers.xml
```

In the UI, find the "Core selector" popup menu and select the "gettingstarted" core, then select the "Query" menu item. This gives you a default search for ":" which returns all docs. Hit the "Execute Query" button, and you should see a few docs with data. Congratulations!

To learn more about Solr, see the [Apache Solr Reference Guide](https://cwiki.apache.org/confluence/display/solr/Apache+Solr+Reference+Guide).

Distributed Solr
You can also run a distributed Solr configuration, with Solr nodes in separate containers, sharing a single ZooKeeper server:

Run ZooKeeper, and define a name so we can link to it:

```shell
docker run --name zookeeper -d -p 2181:2181 -p 2888:2888 -p 3888:3888 jplock/zookeeper
```

Run two Solr nodes, linked to the zookeeper container:

```shell
docker run --name solr1 --link zookeeper:ZK -d -p 8983:8983 \
      quay.io/ukhomeofficedigital/solr:$CONTAINER_VERSION \
      bash -c '/opt/solr/bin/solr start -f -z $ZK_PORT_2181_TCP_ADDR:$ZK_PORT_2181_TCP_PORT'
docker run --name solr2 --link zookeeper:ZK -d -p 8984:8983 \
      quay.io/ukhomeofficedigital/solr:$CONTAINER_VERSION \
      bash -c '/opt/solr/bin/solr start -f -z $ZK_PORT_2181_TCP_ADDR:$ZK_PORT_2181_TCP_PORT'
```

Create a collection:

```shell
docker exec -i -t solr1 /opt/solr/bin/solr create_collection \
        -c collection1 -shards 2 -p 8983
```
Then go to `http://localhost:8983/solr/#/~cloud` (adjust the hostname for your docker host) to see the two shards and Solr nodes.

## Built With

* Solr 5.3.1

## Find Us

* [GitHub](https://github.com/UKHomeOffice/docker-solr)
* [Quay.io](https://quay.io/repository/ukhomeofficedigital/solr)

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the 
[tags on this repository](https://github.com/UKHomeOffice/docker-solr/tags). 

## License

This is based off the official Solr container, and we have included much of the text and code they 
provide.

The primary changes made to this repository is to allow us to base this image of our parent image, 
rather than one provided.

We have sublicensed this variant under the GPLv2 License - see the [LICENSE.md](LICENSE.md) file for
 details. You can find the Apache v2.0 license they distribute that code with at 
[ORIGINAL-LICENSE.md](ORIGINAL-LICENSE.md).

