defmodule FreeBSD do
  @moduledoc """
  Documentation for `FreeBSD`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> FreeBSD.version()
      "13.0-RELEASE-p7"

  """
  def version do
    FreeBSD.Version.freebsd_version()
  end
end
