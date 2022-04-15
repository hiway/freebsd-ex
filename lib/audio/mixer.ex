defmodule FreeBSD.Audio.Mixer do
  @moduledoc """
  Documentation for `FreeBSD.Audio.Mixer`.
  """

  @doc """
  ## Examples

      iex> FreeBSD.Audio.Mixer.volume >= 0
      true

  """
  alias FreeBSD.CLI

  def volume do
    try do
      {out, status} = CLI.exec("mixer", ["vol"])
      case status do
        0 ->  out
                |> String.split("set to")
                |> List.last
                |> String.trim
                |> String.split(":")
                |> List.first
                |> String.trim
                |> String.to_integer
        _ -> 100
      end
    rescue
      ErlangError -> 100
    end
  end
  def volume(value) do
    try do
      {out, status} = CLI.exec("mixer", ["vol", Integer.to_string(value)])
      case status do
        0 ->  out
                |> String.split(" to ")
                |> List.last
                |> String.trim
                |> String.split(":")
                |> List.first
                |> String.trim
                |> String.to_integer
        _ -> 100
      end
    rescue
      ErlangError -> 100
    end
  end
  def volume(target, step, delay) do
    curr = volume()
    if target == curr do
      curr
    else
      next = if (curr - step) < 0 do curr else step end
      :timer.sleep(delay)
      if curr < target do
        volume(curr + next)
        volume(target, next, delay)
      else
        volume(curr - next)
        volume(target, next, delay)
      end
    end
  end

end
