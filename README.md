# Polkaot conformance testing

This repo centralize all the work that Zondax have generated when researching Polkadot conformance testing.

A full report with our conclusions is available under `docs/`.

## Polkadot testing framework with RPC endpoints

Our first approach was to build on top of W3F previous attempt of testing the different Polkadot clients. [Polkadot tests](https://github.com/w3f/polkadot-tests) was using FFI to tests duffreent components for the different programing languages the clients were written in : SCALE Codec Encoding, State Trie Hashing, Polkadot Host API and Genesis Import.

Instead of using FFi which is difficult to maintain, we were recommended to use RPC encpoints. By using the RPC endpoints we would make the testsuite language agnostic but it requires modfying all the node to implement thos testing endpoints. We can find our attempt at it in our [modified Polkadot repo](https://github.com/Zondax/polkadot-sdk). Once compiled [the testsuites scripts](https://github.com/Zondax/Polkadot-conformance-tests) can be called to verify conformance.


## Polkadot P2P testing proof-of-concept

Our second idea was to start new and take advantage of the already standard way of communicating with nodes : P2P mesages. Using libp2p we could feed a node with blocks, transactions, or even send incorrect transactions and verify their behaviors accross all the implementations. This doesn't require modifying the node in anyway and allow a good granularity of tests. [Our PoC](https://github.com/Zondax/polkadot-p2p-testings), just connect to a polkadot node and tests its ping interfaces (which is part of the spec).