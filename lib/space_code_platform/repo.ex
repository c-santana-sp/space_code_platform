defmodule SpaceCodePlatform.Repo do
  use Ecto.Repo,
    otp_app: :space_code_platform,
    adapter: Ecto.Adapters.Postgres
end
