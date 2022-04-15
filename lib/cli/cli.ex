defmodule FreeBSD.CLI do
  def exec(cmd, args, superuser \\ false) do
    if superuser == false or is_root_user?() do
      {out, status} = System.cmd(cmd, args, stderr_to_stdout: true)
      {
        out |> String.trim(),
        status
      }
    else
      {out, status} = System.cmd("doas", [cmd] ++ args, stderr_to_stdout: true)
      {
        out |> String.trim(),
        status
      }
    end
  end

  defp is_root_user? do
    {out, status} = System.cmd("whoami", [])
    out |> String.trim() |> String.equivalent?("root")
  end
end
