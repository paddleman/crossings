defmodule CrossingsWeb.CrossingLiveTest do
  use CrossingsWeb.ConnCase

  import Phoenix.LiveViewTest
  import Crossings.XingsFixtures

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  defp create_crossing(_) do
    crossing = crossing_fixture()
    %{crossing: crossing}
  end

  describe "Index" do
    setup [:create_crossing]

    test "lists all crossings", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, ~p"/crossings")

      assert html =~ "Listing Crossings"
    end

    test "saves new crossing", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/crossings")

      assert index_live |> element("a", "New Crossing") |> render_click() =~
               "New Crossing"

      assert_patch(index_live, ~p"/crossings/new")

      assert index_live
             |> form("#crossing-form", crossing: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#crossing-form", crossing: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/crossings")

      html = render(index_live)
      assert html =~ "Crossing created successfully"
    end

    test "updates crossing in listing", %{conn: conn, crossing: crossing} do
      {:ok, index_live, _html} = live(conn, ~p"/crossings")

      assert index_live |> element("#crossings-#{crossing.id} a", "Edit") |> render_click() =~
               "Edit Crossing"

      assert_patch(index_live, ~p"/crossings/#{crossing}/edit")

      assert index_live
             |> form("#crossing-form", crossing: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#crossing-form", crossing: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/crossings")

      html = render(index_live)
      assert html =~ "Crossing updated successfully"
    end

    test "deletes crossing in listing", %{conn: conn, crossing: crossing} do
      {:ok, index_live, _html} = live(conn, ~p"/crossings")

      assert index_live |> element("#crossings-#{crossing.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#crossings-#{crossing.id}")
    end
  end

  describe "Show" do
    setup [:create_crossing]

    test "displays crossing", %{conn: conn, crossing: crossing} do
      {:ok, _show_live, html} = live(conn, ~p"/crossings/#{crossing}")

      assert html =~ "Show Crossing"
    end

    test "updates crossing within modal", %{conn: conn, crossing: crossing} do
      {:ok, show_live, _html} = live(conn, ~p"/crossings/#{crossing}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Crossing"

      assert_patch(show_live, ~p"/crossings/#{crossing}/show/edit")

      assert show_live
             |> form("#crossing-form", crossing: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#crossing-form", crossing: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/crossings/#{crossing}")

      html = render(show_live)
      assert html =~ "Crossing updated successfully"
    end
  end
end
