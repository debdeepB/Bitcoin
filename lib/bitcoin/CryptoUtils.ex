defmodule CryptoUtils do
  
  def generate_keypair() do
    {public_key, private_key} = :crypto.generate_key(:ecdh, :secp256k1)
    %{
      public_key: public_key,
      private_key: private_key
    }
  end

  def sign(keypair, message) do
    :crypto.sign(:ecdsa, :sha256, message, [keypair.private_key, :secp256k1])
  end

  def verify(keypair, signature, message) do
    :crypto.verify(:ecdsa, :sha256, message, signature, [keypair.public_key, :secp256k1])
  end

  def calculate_hash(data) do
    :crypto.hash(:sha, data)
  end
  
end