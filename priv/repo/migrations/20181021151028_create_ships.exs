defmodule SeaTraders.Repo.Migrations.CreateShips do
  use Ecto.Migration

  def change do
    create table(:ships) do
      add :name, :string, null: false

      timestamps()
    end

  end
end
