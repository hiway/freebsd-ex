defmodule FreeBSD.Version do
  alias FreeBSD.CLI

  def freebsd_version() do
    {out, _status} = CLI.exec("/bin/freebsd-version", [])
    out
  end
  def freebsd_version(:installed_kernel) do
    {out, _status} = CLI.exec("/bin/freebsd-version", ["-k"])
    out
  end
  def freebsd_version(:running_kernel) do
    {out, _status} = CLI.exec("/bin/freebsd-version", ["-r"])
    out
  end
  def freebsd_version(:userland) do
    {out, _status} = CLI.exec("/bin/freebsd-version", ["-u"])
    out
  end
  def freebsd_version(:all) do
    {out, _status} = CLI.exec("/bin/freebsd-version", ["-kru"])
    out
      |> String.split("\n")
      |> then(fn [ik, rk, ul] -> %{installed_kernel: ik, running_kernel: rk, userland: ul} end)
  end
end
