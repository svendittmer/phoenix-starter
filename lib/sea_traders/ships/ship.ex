defmodule SeaTraders.Ships.Ship do
  use Ecto.Schema
  import Ecto.Changeset


  schema "ships" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(ship, attrs) do
    ship
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
