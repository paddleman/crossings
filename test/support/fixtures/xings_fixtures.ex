defmodule Crossings.XingsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Crossings.Xings` context.
  """

  @doc """
  Generate a crossing.
  """
  def crossing_fixture(attrs \\ %{}) do
    {:ok, crossing} =
      attrs
      |> Enum.into(%{

      })
      |> Crossings.Xings.create_crossing()

    crossing
  end

  @doc """
  Generate a road.
  """
  def road_fixture(attrs \\ %{}) do
    {:ok, road} =
      attrs
      |> Enum.into(%{
        transport_line_type_code: "some transport_line_type_code"
      })
      |> Crossings.Xings.create_road()

    road
  end
end
