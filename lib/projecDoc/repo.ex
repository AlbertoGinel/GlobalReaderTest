defmodule ProjecDoc.Repo do
  use Ecto.Repo,
    otp_app: :projecDoc,
    adapter: Ecto.Adapters.Postgres
end
