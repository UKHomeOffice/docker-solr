# Docker Gradle

[![Build Status](https://drone.acp.homeoffice.gov.uk/UKHomeOffice/docker-solr/status.svg)](https://drone.acp.homeoffice.gov.uk/UKHomeOffice/docker-solr) [![Docker Repository on Quay.io](https://quay.io/repository/ukhomeofficedigital/solr/status "Docker Repository on Quay.io")](https://quay.io/repository/ukhomeofficedigital/solr)

Apache Solr in a docker image, the version of the image / tag will match the version of Solr

For more information on this project please refer to: [Docker Solr](https://github.com/docker-solr/docker-solr)

### Usage

## Run Solr and index example data

To run a single Solr server:

```console
$ docker run --name my_solr -d -p 8983:8983 -t solr
```

Then with a web browser go to `http://localhost:8983/` to see the Admin Console (adjust the hostname for your docker host).

To use Solr, you need to create a "core", an index for your data. For example:

```console
$ docker exec -it my_solr solr create_core -c gettingstarted
```

In the web UI if you click on "Core Admin" you should now see the "gettingstarted" core.

If you want to load some of the example data that is included in the container:

```console
$ docker exec -it my_solr post -c gettingstarted example/exampledocs/manufacturers.xml
```

In the UI, find the "Core selector" popup menu and select the "gettingstarted" core, then select the "Query" menu item. This gives you a default search for `*:*` which returns all docs. Hit the "Execute Query" button, and you should see a few docs with data. Congratulations!

## Contributing

Contributions are most certainly welcome. If you want to introduce a breaking
change or any other major change, please raise an issue first to discuss.

## License

[MIT](LICENSE)