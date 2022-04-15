defmodule FreeBSDAudioMixerTest do
  use ExUnit.Case
  doctest FreeBSD.Audio.Mixer

  test "audio mixer api" do
    current_volume = FreeBSD.Audio.Mixer.volume
    assert FreeBSD.Audio.Mixer.volume(100) == 100
    assert FreeBSD.Audio.Mixer.volume(10) == 10

    FreeBSD.Audio.Mixer.volume(100, 10, 100)

    FreeBSD.Audio.Mixer.volume(current_volume)
  end

end
