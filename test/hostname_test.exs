defmodule FreeBSDHostnameTest do
  use ExUnit.Case
  doctest FreeBSD.Hostname

  test "hostname api" do
    assert FreeBSD.Hostname.hostname() != ""
  end
end
