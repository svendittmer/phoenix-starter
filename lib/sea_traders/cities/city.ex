defmodule SeaTraders.Cities.City do
  use Ecto.Schema
  import Ecto.Changeset


  schema "cities" do
    field :latitude, :float
    field :longitude, :float
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(city, attrs) do
    city
    |> cast(attrs, [:name, :longitude, :latitude])
    |> validate_required([:name, :longitude, :latitude])
  end
end
