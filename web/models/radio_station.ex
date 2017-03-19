defmodule VolnaApi.RadioStation do
  use VolnaApi.Web, :model

  schema "radio_stations" do
    field :name, :string
    field :url, :string
    field :image, :string
    field :position, :string
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :url, :image, :position])
    |> validate_required([:name, :url, :position, :image], message: "Missing Requires Params")
  end
end
