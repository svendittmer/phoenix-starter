defmodule SeaTraders.Repo.Migrations.AddTravelInfoToShips do
  use Ecto.Migration

  def change do
    alter table(:ships) do
      add :anchorage_id, references(:cities, on_delete: :restrict)
      add :destination_id, references(:cities, on_delete: :restrict)
      add :departed_at, :utc_datetime
      add :estimated_arrival_at, :utc_datetime
    end
  end
end
