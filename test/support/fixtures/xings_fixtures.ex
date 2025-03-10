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
end
