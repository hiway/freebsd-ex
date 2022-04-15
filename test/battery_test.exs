defmodule FreeBSDBatteryTest do
  use ExUnit.Case
  doctest FreeBSD.Battery

  test "battery api" do
    if FreeBSD.Battery.has_battery? do
      batt = FreeBSD.Battery.charge_percent
      assert batt >= 0
      assert batt <= 100

      if FreeBSD.Battery.has_ac_power? == true do
        assert FreeBSD.Battery.is_charging? == true
      else
        assert FreeBSD.Battery.is_discharging? == true
      end
    else
      batt = FreeBSD.Battery.charge_percent
      assert batt == 100
    end
  end
end
