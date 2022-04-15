defmodule FreeBSD.Hostname do
  @moduledoc """
  Documentation for `FreeBSD.Hostname`.
  """

  @doc """
  ## Examples

      iex> FreeBSD.Hostname.hostname

  """
  alias FreeBSD.CLI

  def hostname do
    {out, _status} = CLI.exec("/bin/hostname", [])
    out
  end
end
