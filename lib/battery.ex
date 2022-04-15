defmodule FreeBSD.Battery do
  @moduledoc """
  Documentation for `FreeBSD.Battery`.
  """

  @doc """
  ## Examples

      iex> FreeBSD.Battery.has_battery?
      true

      iex> FreeBSD.Battery.charge_percent > 30
      true

  """
  alias FreeBSD.CLI

  def has_battery? do
    {_out, status} = CLI.exec("sysctl", ["-n", "hw.acpi.battery.life"])
    case status do
      0 -> true
      _ -> false
    end
  end

  def has_ac_power? do
    if has_battery? do
      {out, _status} = CLI.exec("apm", ["-a"])
      out == "1"
    else
      true
    end
  end

  def is_charging? do
    if has_battery? do
      {out, _status} = CLI.exec("apm", [])
      charging_status = out
        |> String.split("\n")
        |> Enum.filter(fn l -> String.contains?(l, "Battery Status:") end)
        |> List.first()
        |> String.split(":")
        |> List.last
        |> String.trim

      charging_status == "charging"
    else
      false
    end
  end

  def is_discharging? do
    if has_battery? do
      {out, _status} = CLI.exec("apm", [])
      ac_line_status = out
        |> String.split("\n")
        |> Enum.filter(fn l -> String.contains?(l, "AC Line status:") end)
        |> List.first
        |> String.split(":")
        |> List.last
        |> String.trim

      ac_line_status == "off-line"
    else
      false
    end
  end

  def charge_percent do
    {out, status} = CLI.exec("sysctl", ["-n", "hw.acpi.battery.life"])
    case status do
      0 -> out |> String.to_integer()
      _ -> 100
    end
  end
end
