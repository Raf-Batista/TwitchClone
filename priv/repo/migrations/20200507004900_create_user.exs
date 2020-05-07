defmodule TwitchClone.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:user) do
      add :username, :string
      add :email, :string
      add :provider, :string 
      add :token, :string

      timestamps()
    end

  end
end
