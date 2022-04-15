defmodule FreeBSDLoadavgTest do
  use ExUnit.Case
  doctest FreeBSD.Loadavg

  test "loadavg api" do
    assert FreeBSD.Loadavg.one >= 0.1
    assert FreeBSD.Loadavg.five >= 0.1
    assert FreeBSD.Loadavg.fifteen >= 0.1
  end
end
