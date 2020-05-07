defmodule TwitchClone.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user" do
    field :username, :string 
    field :email, :string 
    field :provider, :string
    field :token, :string 

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email, :provider, :token])
    |> validate_required([:username, :email, :provider, :token])
  end
end
