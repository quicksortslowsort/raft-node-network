# raft-node-network

A partial implmentation of the Raft consensus algorithm.

## Raft

Raft is a consensus algorithm developed as an alternative to Paxos. It is fault-tolerant and is designed to be easy to understand. Raft's consensus model is based on a Leader/Follower relationship with each cluster containing one and only one Leader which is responsible for log replication among the cluster.

For more information on Raft, visit https://raft.github.io/

## This implementation

This partial implementation is a work in progress.

Each Node in this implementation is a Dockerized Ruby state machine which implements the Raft algorithm. RabbitMQ is utilized as the messaging backend, and as of the writing of this documentation one RabbitMQ instance is shared among all nodes.

This implementation is intended to be run in a Kubernetes cluster and contains K8s manifests to create Deployments and Services.

# Building

WIP

# Deploying

WIP
