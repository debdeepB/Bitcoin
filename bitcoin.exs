# start the simulation
genesis_block = Block.create_genesis_block
initial_state = %{
  blockchain: [genesis_block],
  keypair: %{}
}

{:ok, pending_transactions} = PendingTransactions.start_link([])
:global.register_name("pending_transactions", pending_transactions)
{:ok, peer1} = Peer.start_link(initial_state)
{:ok, peer2} = Peer.start_link(initial_state)
{:ok, peer3} = Peer.start_link(initial_state)
:global.register_name("peer-1", peer1)
:global.register_name("peer-2", peer2)
:global.register_name("peer-3", peer3)

Peer.mine(peer1)
bc = :sys.get_state(peer1).blockchain


# keypair1 = CryptoUtils.generate_keypair
# keypair2 = CryptoUtils.generate_keypair

# tx = Transaction.create_transaction(keypair1.public_key, keypair2.public_key, 100.0)
# tx = Transaction.sign_transaction(tx, keypair1)
# IO.puts Transaction.is_valid(tx)
# tx = Map.put(tx, :amount, 1000.0)
# IO.puts Transaction.is_valid(tx)