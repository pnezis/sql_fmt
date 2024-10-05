defmodule SqlFmt do
  @moduledoc """
  Docs placeholder
  """

  version = Mix.Project.config()[:version]

  use RustlerPrecompiled,
    otp_app: :sql_fmt,
    crate: :sql_formatter,
    base_url: "https://github.com/akoutmos/sql_fmt/releases/download/v#{version}",
    force_build: System.get_env("RUSTLER_PRECOMPILATION_EXAMPLE_BUILD") in ["1", "true"],
    targets: Enum.uniq(["aarch64-unknown-linux-musl" | RustlerPrecompiled.Config.default_targets()]),
    version: version

  def format(_sql_query), do: :erlang.nif_error(:nif_not_loaded)
end