# start the simulation
genesis_block = BlockchainUtils.create_genesis_block
blockchain = [genesis_block]
{:ok, peer1} = Peer.start_link(blockchain)
{:ok, peer2} = Peer.start_link(blockchain)
{:ok, peer3} = Peer.start_link(blockchain)
:global.register_name("peer1", peer1)
:global.register_name("peer2", peer2)
:global.register_name("peer3", peer3)