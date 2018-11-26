# Bitcoin

## Members

Debdeep Basu 4301 - 3324  
Ali Akbar 8498-3349

## Setup

Test cases have been written and are there in the test/bitcoin folder.

To run all tests run:

```bash
mix test
```

## Functionalities implemented

### Mine Bitcoins

A peer can mine bitcoins. The difficulty threshold is kept at 2 leading 0's but can be increased to any arbitary number. A mining reward is given to the peer who mines a block succesfully.

### Implement Wallets

Wallets are implemented and peers in the network can check their balance.

### Transact Bitcoins

Peers can perform transactions and send bitcoins to each other. Everything gets recorded in the transaction ledger (PendingTransactions)which gets mined when a peer mines a new block.

## Bonus Features

### Distributed functionality

Each peer has it's own copy of blockchain. Each peer can mine and transact bitcoins. Whenever a peer mines a block, it adds it to it's blockchain and broadcasts it to the rest of the peers. All the other peers validates the incoming block and if it is valid then they add it to their respective blockchains.


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `bitcoin` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:bitcoin, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/bitcoin](https://hexdocs.pm/bitcoin).

