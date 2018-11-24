defmodule Bitcoin.BlockTest do
  use ExUnit.Case, async: true

  setup do
    genesis_block = Block.create_genesis_block
    transactions = [Transaction.create_transaction("from", "to", 9), Transaction.create_transaction("add1", "add2", 9)]
    block = Block.create_block(100, transactions, genesis_block.hash)
    %{genesis_block: genesis_block, block: block, transactions: transactions}
  end

  test "Checks whether genesis block was created correctly", %{genesis_block: genesis_block} do
    assert genesis_block.transactions == []
    assert genesis_block.nonce == 0
  end

  test "Checks whether block was created correctly", %{genesis_block: genesis_block, block: block, transactions: transactions} do
    assert block.transactions == transactions
    assert block.previous_hash == genesis_block.hash
  end
  
end