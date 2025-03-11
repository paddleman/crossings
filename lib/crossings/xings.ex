defmodule Crossings.Xings do
  @moduledoc """
  The Xings context.
  """

  import Ecto.Query, warn: false
  alias Crossings.Repo

  alias Crossings.Xings.Crossing

  @doc """
  Returns the list of crossings.

  ## Examples

      iex> list_crossings()
      [%Crossing{}, ...]

  """
  def list_crossings do
    Repo.all(Crossing)
  end

  @doc """
  Gets a single crossing.

  Raises `Ecto.NoResultsError` if the Crossing does not exist.

  ## Examples

      iex> get_crossing!(123)
      %Crossing{}

      iex> get_crossing!(456)
      ** (Ecto.NoResultsError)

  """
  def get_crossing!(id) do
    Crossings
    |> Repo.get!(id)

    # |> Repo.preload([:watercourse, :road])
  end

  @doc """
  Creates a crossing.

  ## Examples

      iex> create_crossing(%{field: value})
      {:ok, %Crossing{}}

      iex> create_crossing(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_crossing(attrs \\ %{}) do
    %Crossing{}
    |> Crossing.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a crossing.

  ## Examples

      iex> update_crossing(crossing, %{field: new_value})
      {:ok, %Crossing{}}

      iex> update_crossing(crossing, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_crossing(%Crossing{} = crossing, attrs) do
    crossing
    |> Crossing.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a crossing.

  ## Examples

      iex> delete_crossing(crossing)
      {:ok, %Crossing{}}

      iex> delete_crossing(crossing)
      {:error, %Ecto.Changeset{}}

  """
  def delete_crossing(%Crossing{} = crossing) do
    Repo.delete(crossing)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking crossing changes.

  ## Examples

      iex> change_crossing(crossing)
      %Ecto.Changeset{data: %Crossing{}}

  """
  def change_crossing(%Crossing{} = crossing, attrs \\ %{}) do
    Crossing.changeset(crossing, attrs)
  end

  alias Crossings.Xings.Road

  @doc """
  Returns the list of roads.

  ## Examples

      iex> list_roads()
      [%Road{}, ...]

  """
  def list_roads do
    Repo.all(Road)
  end

  @doc """
  Gets a single road.

  Raises `Ecto.NoResultsError` if the Road does not exist.

  ## Examples

      iex> get_road!(123)
      %Road{}

      iex> get_road!(456)
      ** (Ecto.NoResultsError)

  """
  def get_road!(id), do: Repo.get!(Road, id)

  @doc """
  Creates a road.

  ## Examples

      iex> create_road(%{field: value})
      {:ok, %Road{}}

      iex> create_road(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_road(attrs \\ %{}) do
    %Road{}
    |> Road.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a road.

  ## Examples

      iex> update_road(road, %{field: new_value})
      {:ok, %Road{}}

      iex> update_road(road, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_road(%Road{} = road, attrs) do
    road
    |> Road.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a road.

  ## Examples

      iex> delete_road(road)
      {:ok, %Road{}}

      iex> delete_road(road)
      {:error, %Ecto.Changeset{}}

  """
  def delete_road(%Road{} = road) do
    Repo.delete(road)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking road changes.

  ## Examples

      iex> change_road(road)
      %Ecto.Changeset{data: %Road{}}

  """
  def change_road(%Road{} = road, attrs \\ %{}) do
    Road.changeset(road, attrs)
  end
end
