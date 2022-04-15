defmodule FreeBSD.Loadavg do
  @moduledoc """
  Documentation for `FreeBSD.Loadavg`.
  """

  @doc """
  ## Examples

      iex> FreeBSD.Loadavg.one > 0.01
      true

  """
  alias FreeBSD.CLI

  def all do
    {out, _status} = CLI.exec("/usr/bin/uptime", [])
    [one, five, fifteen] = out
      |> String.split("load averages:")
      |> List.last
      |> String.split(",")
      |> Enum.map(fn v -> v |> String.trim |> String.to_float end)
    %{
      one: one,
      five: five,
      fifteen: fifteen,
    }
  end

  def one do
    all()[:one]
  end

  def five do
    all()[:five]
  end

  def fifteen do
    all()[:fifteen]
  end
end
