defmodule Crossings.Structures.Structure do
  use Ecto.Schema
  import Ecto.Changeset

  schema "structures" do
    field :data_source, :string
    field :structure_type_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(structure, attrs) do
    structure
    |> cast(attrs, [:data_source])
    |> validate_required([:data_source])
  end
end
