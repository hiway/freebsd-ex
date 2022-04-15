defmodule FreeBSDDisplayBacklightTest do
  use ExUnit.Case
  doctest FreeBSD.Battery

  test "backlight api" do
    current_brightness = FreeBSD.Display.Backlight.brightness
    assert FreeBSD.Display.Backlight.brightness(10)
    :timer.sleep(100)
    assert FreeBSD.Display.Backlight.brightness(20)
    :timer.sleep(100)
    assert FreeBSD.Display.Backlight.brightness(40)
    :timer.sleep(100)
    assert FreeBSD.Display.Backlight.brightness(60)
    :timer.sleep(100)
    assert FreeBSD.Display.Backlight.brightness(current_brightness) <= current_brightness
  end

  test "backlight fade" do
    current_brightness = FreeBSD.Display.Backlight.brightness
    assert FreeBSD.Display.Backlight.brightness(100, 2, 10)
    assert FreeBSD.Display.Backlight.brightness(current_brightness) <= current_brightness
  end
end
