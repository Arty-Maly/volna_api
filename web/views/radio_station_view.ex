defmodule VolnaApi.RadioStationView do
  use VolnaApi.Web, :view

  def render("index.json", %{radio_stations: radio_stations}) do
     # = %{}
    # %{stations: Enum.map(radio_stations, &to_json/1)}
    json_map = Enum.reduce radio_stations, %{}, fn station, acc ->
      Map.put(acc, station.name, to_json(station))
    end
    json_map
  end

  def to_json(radio_station) do
    %{
      name: radio_station.name,
      url: radio_station.url,
      image: radio_station.image,
      position: radio_station.position
    }
  end
end
