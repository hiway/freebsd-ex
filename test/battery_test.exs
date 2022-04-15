defmodule FreeBSDBatteryTest do
  use ExUnit.Case
  doctest FreeBSD.Battery

  test "battery api" do
    if FreeBSD.Battery.has_battery? do
      if FreeBSD.Battery.has_ac_power? == true do
        if FreeBSD.Battery.is_charging? == true do
          assert FreeBSD.Battery.charge_percent <= 99
        else
          assert FreeBSD.Battery.charge_percent >= 99
        end
      else
        assert FreeBSD.Battery.is_discharging? == true
      end
    else
      batt = FreeBSD.Battery.charge_percent
      assert batt == 100
    end
  end
end
