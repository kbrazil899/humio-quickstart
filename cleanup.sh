#!/bin/bash

for humiodir in $(ls cluster | grep humio); do
  echo "cleaning cluster/${humiodir} data..."
  rm -rf ./cluster/${humiodir}/humio-data/*
  echo "cleaning cluster/${humiodir} logs..."
  rm -rf ./cluster/${humiodir}/logs/*
done

for kafkadir in $(ls cluster | grep kafka); do
  echo "cleaning cluster/${kafkadir} data..."
  rm -rf ./cluster/${kafkadir}/kafka-data/*
  rm -f ./cluster/${kafkadir}/kafka-data/.lock
  echo "cleaning cluster/${kafkadir} logs..."
  rm -rf ./cluster/${kafkadir}/logs/*
done

for zookeeperdir in $(ls cluster | grep zookeeper); do
  echo "cleaning cluster/${zookeeperdir} data..."
  for dir in $(ls ./cluster/${zookeeperdir}/zookeeper-data | grep -v myid); do
    rm -rf ./cluster/${zookeeperdir}/zookeeper-data/${dir}
  done
  echo "cleaning cluster/${zookeeperdir} logs..."
  rm -rf ./cluster/${zookeeperdir}/logs/*
done

echo "cleaning standalone/data..."
rm -rf ./standalone/data/*
