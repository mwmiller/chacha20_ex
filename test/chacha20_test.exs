defmodule Chacha20Test do
  use PowerAssert
  doctest Chacha20
  import Chacha20

  test "single crypt" do
    k = "this is 32 bytes long as our key"
    n = "12byte nonce"

    encrypted = crypt("secret message", k, n)

    assert encrypted == <<32, 2, 229, 62, 139, 95, 158, 111, 157, 152, 61, 116, 173, 188>>
    assert encrypted |> crypt(k,n) == "secret message"

  end

  test "stream crypt" do
    k = "this is 32 bytes long as our key"
    n = "12byte nonce"

    {s,p} = crypt_bytes("sec", {k,n,0,""},[])
    {full_message, _,} = crypt_bytes("ret message", p, [s])

    assert full_message == <<32, 2, 229, 62, 139, 95, 158, 111, 157, 152, 61, 116, 173, 188>>
  end

  test "reference version" do
    k = "this is 32 bytes long as our key"
    n = "8B nonce"

    encrypted = crypt("secret message", k, n)

    assert encrypted == <<86, 106, 88, 28, 178, 149, 2, 246, 179, 70, 64, 248, 181, 170>>
    assert encrypted |> crypt(k,n) == "secret message"

    {s,p} = crypt_bytes("sec", {k,n,0,""},[])
    {full_message, _,} = crypt_bytes("ret message", p, [s])

    assert full_message == encrypted
  end


end
