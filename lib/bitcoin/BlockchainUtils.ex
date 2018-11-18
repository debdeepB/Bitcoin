defmodule BlockchainUtils do
  def create_genesis_block do
    create_block(:os.system_time(:millisecond), [], "")
  end

  def create_block(timestamp, transactions, previousHash \\ "") do
    nonce = 0
    serialized_block = previousHash <> Integer.to_string(timestamp) <> Poison.encode!(transactions) <> Integer.to_string(nonce)
    %{
      previousHash: previousHash,
      timestamp: timestamp,
      transactions: transactions,
      nonce: nonce,
      hash: serialized_block |> CryptoUtils.calculateHash
    }
  end
end