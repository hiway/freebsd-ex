defmodule FreeBSDUpdateTest do
  use ExUnit.Case
  doctest FreeBSD.Update

  # Disabled because `fetch` accesses remote servers (and is slow).
  #
  # test "freebsd-update fetch" do
  #   assert FreeBSD.Update.fetch() |> String.contains?("Preparing to download files")
  # end

  test "freebsd-update ready?" do
    # Assumes tests are running on an up-to-date FreeBSD system
    assert FreeBSD.Update.ready? == false
  end

  test "freebsd-update install" do
    # Assumes any updates have been installed before running tests
    assert FreeBSD.Update.install
      |> String.starts_with?("No updates are available to install")
  end

end
