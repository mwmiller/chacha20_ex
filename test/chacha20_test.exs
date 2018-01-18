defmodule Chacha20Test do
  use ExUnit.Case
  doctest Chacha20
  import Chacha20

  test "single crypt" do
    k = "this is 32 bytes long as our key"
    n = "12byte nonce"

    encrypted = crypt("secret message", k, n)

    assert encrypted == <<140, 84, 30, 226, 54, 20, 142, 173, 31, 198, 174, 17, 77, 140>>
    assert encrypted |> crypt(k, n) == "secret message"
  end

  test "stream crypt" do
    k = "this is 32 bytes long as our key"
    n = "12byte nonce"

    {s, p} = crypt_bytes("sec", {k, n, 0, ""}, [])
    {full_message, _} = crypt_bytes("ret message", p, [s])

    assert full_message == <<140, 84, 30, 226, 54, 20, 142, 173, 31, 198, 174, 17, 77, 140>>
  end

  test "reference version" do
    k = "this is 32 bytes long as our key"
    n = "8B nonce"

    encrypted = crypt("secret message", k, n)

    assert encrypted == <<173, 65, 29, 62, 161, 111, 223, 87, 250, 120, 1, 164, 202, 17>>
    assert encrypted |> crypt(k, n) == "secret message"

    {s, p} = crypt_bytes("sec", {k, n, 0, ""}, [])
    {full_message, _} = crypt_bytes("ret message", p, [s])

    assert full_message == encrypted
  end
end
