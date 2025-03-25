defmodule Crossings.Structures.Structure do
  use Ecto.Schema
  import Ecto.Changeset

  alias Crossings.Xings.Crossing
  alias Crossings.Structures.Culvert
  alias Crossings.Structures.Bridge

  schema "structures" do
    field :data_source, :string
    field :structure_type_id, :id

    has_many :bridge, Bridge
    has_many :culvert, Culvert

    belongs_to :crossing, Crossing

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(structure, attrs) do
    structure
    |> cast(attrs, [:data_source])
    |> validate_required([:data_source])
  end
end
