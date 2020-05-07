defmodule TwitchClone.Repo do
  use Ecto.Repo,
    otp_app: :twitch_clone,
    adapter: Ecto.Adapters.Postgres
end
