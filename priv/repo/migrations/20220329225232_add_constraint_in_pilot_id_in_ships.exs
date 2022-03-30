defmodule SpaceCodePlatform.Repo.Migrations.AddConstraintInPilotIdInShips do
  use Ecto.Migration

  def change do
    create unique_index(:ships, [:pilot_id], name: :unique_pilot_id)
  end
end
