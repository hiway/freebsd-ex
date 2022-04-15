defmodule FreeBSDTest do
  use ExUnit.Case
  doctest FreeBSD

  test "freebsd-version contains RELEASE" do
    assert FreeBSD.version() |> String.contains?("RELEASE")
  end
end
