# Polkadot Conformance Testing

This repository is a comprehensive collection of Zondax's research and work on Polkadot conformance testing.

A detailed report, which includes the findings and conclusions, is available in the `docs/` directory.

## Polkadot Testing Framework with RPC Endpoints

The initial strategy was to build on the previous efforts by W3F to test the various Polkadot clients. The [Polkadot tests](https://github.com/w3f/polkadot-tests) employed FFI to test various components across different programming languages that the clients were written in: SCALE Codec Encoding, State Trie Hashing, Polkadot Host API, and Genesis Import.

Instead of using FFI, which proved challenging to maintain, the recommendation was to use RPC endpoints. By leveraging the RPC endpoints, the test suite could be made language-agnostic. However, this required modifications to all the nodes to implement these testing endpoints. An attempt at this can be found in the [modified Polkadot repo](https://github.com/Zondax/polkadot-sdk). Once compiled, [the test suite scripts](https://github.com/Zondax/Polkadot-conformance-tests) can be executed to verify conformance.

## Polkadot P2P Testing Proof-of-Concept

The second approach was to start anew and take advantage of the already standardized way of communicating with nodes: P2P messages. Using libp2p, a node could be fed with blocks, transactions, or even incorrect transactions to verify their behaviors across all the implementations. This approach does not require modifying the node in any way and allows for a high granularity of tests. The [PoC](https://github.com/Zondax/polkadot-testing-p2p) simply connects to a Polkadot node and tests its ping interface (which is part of the spec).
