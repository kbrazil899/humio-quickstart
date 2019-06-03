# Humio Quickstart

This project contains all you need to get a local cluster or standalone version
of Humio running locally.

You can find more information on installing Humio yourself outside of this
project in the Humio documentation: https://docs.humio.com/installation/

If you have trouble getting the container running, check our Docker
documentation: https://docs.humio.com/installation/docker/

## Getting Started

You can run Humio in two different configurations: clustered or standalone. In
the clustered configuration you'll get 3 Kafka nodes, 2 Zookeeper nodes, and
2 Humio nodes. In the standalone configuration you'll get a single node that's
running a single instance of all 3 services.

### Cluster

You can start Humio in a clustered environment by running this:

```
cd cluster
docker-compose up
```

It will take a minute or two to fire everything up, but once it's done you'll
see log entries like this displayed:

```
humio-core2   | Humio API bound to host=0.0.0.0 port=8080
humio-core2   | Humio server is now running!
humio-core1   | Humio API bound to host=0.0.0.0 port=8080
humio-core1   | Humio server is now running!
```

You should be able to browse to Humio at http://0.0.0.0:8080 then.

### Standalone

You can start Humio in a standalone fashion by running this:

```
cd standalone
docker-compose up
```

It will take a few seconds to fire everything up, but once it's done you'll
see log entries like this displayed:

```
humio    | 2019-03-27 19:25:29,483 INFO success: zookeeper entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
humio    | 2019-03-27 19:25:29,483 INFO success: kafka entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
humio    | 2019-03-27 19:25:29,485 INFO success: humio entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
```

If these entries are continually being printed, then something is wrong and the
services are restarting continuously.

If all went well, you should be able to browse to Humio at http://0.0.0.0:8080.

## Cleanup

WARNING: These steps will remove all data you've sent to Humio and any settings
         you've changed in the UI. All data in Kafka and Zookeeper will also be
         cleared out.

To get things back to their original state, do the following.

Stop the containers in the running environment by pressing `ctrl-c`. After all
containers have stopped, run this:

```
docker-compose down
```

Now back out of the standalone or cluster directory and run the cleanup script:

```
cd ..
bin/cleanup
```

This will delete all artifacts created by Kafka, Zookeeper and Humio while they
were running.
