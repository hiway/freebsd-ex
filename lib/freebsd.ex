defmodule FreeBSD do
  @moduledoc """
  Documentation for `FreeBSD`.
  """

  @doc """
  ## Examples

      iex> FreeBSD.version
      "13.0-RELEASE-p11"

  """
  def version do
    FreeBSD.Version.freebsd_version
  end

  def update do
    FreeBSD.Update.fetch
    FreeBSD.Update.install
  end

  def hostname do
    FreeBSD.Hostname.hostname
  end
end
