defmodule SpaceCodePlatform.Repo.Migrations.AddPlanetsTable do
  use Ecto.Migration

  def change do
    create table(:planets, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      timestamps()
    end
  end
end
