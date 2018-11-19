# start the simulation
genesis_block = Block.create_genesis_block
blockchain = [genesis_block]
{:ok, peer1} = Peer.start_link(blockchain)
{:ok, peer2} = Peer.start_link(blockchain)
{:ok, peer3} = Peer.start_link(blockchain)
:global.register_name("peer1", peer1)
:global.register_name("peer2", peer2)
:global.register_name("peer3", peer3)

keypair1 = CryptoUtils.generate_keypair
keypair2 = CryptoUtils.generate_keypair

tx = Transaction.create_transaction(keypair1.public_key, keypair2.public_key, 100.0)
tx = Transaction.sign_transaction(tx, keypair1)
IO.puts Transaction.is_valid(tx)
tx = Map.put(tx, :amount, 1000.0)
IO.puts Transaction.is_valid(tx)