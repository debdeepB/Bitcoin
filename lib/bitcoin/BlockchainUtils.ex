defmodule BlockchainUtils do
  def create_genesis_block do
    create_block(:os.system_time(:millisecond), [], "")
  end

  def create_block(timestamp, transactions, previous_hash \\ "") do
    nonce = 0
    serialized_block = previous_hash <> Integer.to_string(timestamp) <> Poison.encode!(transactions) <> Integer.to_string(nonce)
    %{
      previous_hash: previous_hash,
      timestamp: Integer.to_string(timestamp),
      transactions: transactions,
      nonce: nonce,
      hash: serialized_block |> CryptoUtils.calculate_hash
    }
  end

  def calculate_hash(block) do
    block.previous_hash <> block.timestamp <> Poison.encode!(block.transactions) <> Integer.to_string(block.nonce) |> CryptoUtils.calculate_hash
  end

  def mine_block(block) do
    if (!String.starts_with?(Base.encode16(block.hash), "00")) do
      IO.puts Base.encode16(block.hash)
      nonce = block.nonce
      block = Map.put(block, :nonce, nonce + 1)
      block = Map.put(block, :hash, calculate_hash(block))
      mine_block(block)
    else
      block
    end
  end
end