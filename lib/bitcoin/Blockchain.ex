defmodule Blockchain do
  def add_transaction(pending_transaction_pid, tx) do
    cond do
      tx.from_address == "" or tx.to_address == "" ->
        {:error, "No from or to address in transaction"}
      !Transaction.is_valid(tx) ->
        {:error, "Invalid transaction"}
      true ->
        PendingTransactions.add(pending_transaction_pid, tx)
    end
  end

  # mine pending transactions and get the mined block in return
  def mine_pending_transactions(pending_transaction_pid, mining_reward_address, previous_hash) do
    reward_amount = 1000.0
    reward_tx = Transaction.create_transaction("", 
                                              mining_reward_address,
                                              reward_amount)
    PendingTransactions.add(pending_transaction_pid, reward_tx)

    block = Block.create_block(:os.system_time(:millisecond),
                                PendingTransactions.get_pending_transactions(pending_transaction_pid),
                                previous_hash
                                )
    Block.mine_block(block)
  end

end