defmodule FreeBSDVersionTest do
  use ExUnit.Case

  test "freebsd-version contains RELEASE" do
    assert FreeBSD.Version.freebsd_version() |> String.contains?("RELEASE")
    assert FreeBSD.Version.freebsd_version(:installed_kernel) |> String.contains?("RELEASE")
    assert FreeBSD.Version.freebsd_version(:all)[:userland] |> String.contains?("RELEASE")
  end
end
