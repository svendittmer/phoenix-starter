defmodule SeaTradersWeb.ShipView do
  use SeaTradersWeb, :view

  def cities do
    SeaTraders.Cities.list_cities
    |> Enum.map(fn city -> [value: city.id, key: city.name] end)
  end

  def city_name(city) do
    if city do
      city.name
    else
      ''
    end
  end
end
