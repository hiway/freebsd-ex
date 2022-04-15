defmodule FreeBSD.Display.Backlight do
  @moduledoc """
  Documentation for `FreeBSD.Display.Backlight`.
  """

  @doc """
  ## Examples

      iex> Display.Backlight.brightness
      100

      iex> Display.Backlight.brightness(50)
      50

  """
  alias FreeBSD.CLI

  def brightness do
    try do
      {out, _status} = CLI.exec("intel_backlight", [])
      out
        |> String.split(":")
        |> List.last
        |> String.trim
        |> String.split("%")
        |> List.first
        |> String.trim
        |> String.to_integer
    rescue
      ErlangError -> 100
    end
  end
  def brightness(value) do
    try do
      {out, _status} = CLI.exec("intel_backlight", [Integer.to_string(value)])
      out
        |> String.split("\n")
        |> List.last
        |> String.split("backlight to")
        |> List.last
        |> String.trim
        |> String.split("%")
        |> List.first
        |> String.trim
        |> String.to_integer
    rescue
      ErlangError -> 100
    end
  end
  def brightness(target, step, delay) do
    curr = brightness()
    if target == curr do
      curr
    else
      next = if (curr - step) < 0 do curr else step end
      :timer.sleep(delay)
      if curr < target do
        brightness(curr + next)
        brightness(target, next, delay)
      else
        brightness(curr - next)
        brightness(target, next, delay)
      end
    end
  end

end
