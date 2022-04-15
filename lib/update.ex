defmodule FreeBSD.Update do
  @moduledoc """
  Documentation for `FreeBSD.Update`.
  """

  @doc """
  ## Examples

      iex> FreeBSD.Update.ready?
      false

  """
  alias FreeBSD.CLI

  def ready? do
    {out, _status} = CLI.exec("/usr/sbin/freebsd-update", ["updatesready"], true)
    out |> String.starts_with?("There are updates available to install")
  end

  def fetch do
    {out, _status} = CLI.exec("/usr/bin/env", ["PAGER=/bin/cat", "/usr/sbin/freebsd-update", "--not-running-from-cron", "fetch"], true)
    out
  end

  def install do
    {out, _status} = CLI.exec("/usr/bin/env", ["PAGER=/bin/cat", "/usr/sbin/freebsd-update", "--not-running-from-cron", "install"], true)
    out
  end
end
