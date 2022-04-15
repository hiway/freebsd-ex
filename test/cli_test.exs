defmodule FreeBSDCLITest do
  use ExUnit.Case
  doctest FreeBSD.CLI

  test "run command as superuser" do
    {out, _} = FreeBSD.CLI.exec("whoami", [], true)
    assert String.equivalent?(out, "root")
  end
end
