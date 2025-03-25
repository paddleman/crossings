defmodule CrossingsWeb.BridgeLiveTest do
  use CrossingsWeb.ConnCase

  import Phoenix.LiveViewTest
  import Crossings.StructureFixtures

  @create_attrs %{type: "some type", length: 120.5, width: 42, structure_number: "some structure_number", structure_name: "some structure_name", shape: "some shape", diameter: 42, height: 42, cover_depth: 42, bci: 120.5, urgency: 42, year_build: 42, last_inspected: "2025-03-22", service_area_code: 42, latitude: 120.5, longitude: 120.5, data_source: "some data_source"}
  @update_attrs %{type: "some updated type", length: 456.7, width: 43, structure_number: "some updated structure_number", structure_name: "some updated structure_name", shape: "some updated shape", diameter: 43, height: 43, cover_depth: 43, bci: 456.7, urgency: 43, year_build: 43, last_inspected: "2025-03-23", service_area_code: 43, latitude: 456.7, longitude: 456.7, data_source: "some updated data_source"}
  @invalid_attrs %{type: nil, length: nil, width: nil, structure_number: nil, structure_name: nil, shape: nil, diameter: nil, height: nil, cover_depth: nil, bci: nil, urgency: nil, year_build: nil, last_inspected: nil, service_area_code: nil, latitude: nil, longitude: nil, data_source: nil}

  defp create_bridge(_) do
    bridge = bridge_fixture()
    %{bridge: bridge}
  end

  describe "Index" do
    setup [:create_bridge]

    test "lists all bridges", %{conn: conn, bridge: bridge} do
      {:ok, _index_live, html} = live(conn, ~p"/bridges")

      assert html =~ "Listing Bridges"
      assert html =~ bridge.type
    end

    test "saves new bridge", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/bridges")

      assert index_live |> element("a", "New Bridge") |> render_click() =~
               "New Bridge"

      assert_patch(index_live, ~p"/bridges/new")

      assert index_live
             |> form("#bridge-form", bridge: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#bridge-form", bridge: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/bridges")

      html = render(index_live)
      assert html =~ "Bridge created successfully"
      assert html =~ "some type"
    end

    test "updates bridge in listing", %{conn: conn, bridge: bridge} do
      {:ok, index_live, _html} = live(conn, ~p"/bridges")

      assert index_live |> element("#bridges-#{bridge.id} a", "Edit") |> render_click() =~
               "Edit Bridge"

      assert_patch(index_live, ~p"/bridges/#{bridge}/edit")

      assert index_live
             |> form("#bridge-form", bridge: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#bridge-form", bridge: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/bridges")

      html = render(index_live)
      assert html =~ "Bridge updated successfully"
      assert html =~ "some updated type"
    end

    test "deletes bridge in listing", %{conn: conn, bridge: bridge} do
      {:ok, index_live, _html} = live(conn, ~p"/bridges")

      assert index_live |> element("#bridges-#{bridge.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#bridges-#{bridge.id}")
    end
  end

  describe "Show" do
    setup [:create_bridge]

    test "displays bridge", %{conn: conn, bridge: bridge} do
      {:ok, _show_live, html} = live(conn, ~p"/bridges/#{bridge}")

      assert html =~ "Show Bridge"
      assert html =~ bridge.type
    end

    test "updates bridge within modal", %{conn: conn, bridge: bridge} do
      {:ok, show_live, _html} = live(conn, ~p"/bridges/#{bridge}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Bridge"

      assert_patch(show_live, ~p"/bridges/#{bridge}/show/edit")

      assert show_live
             |> form("#bridge-form", bridge: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#bridge-form", bridge: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/bridges/#{bridge}")

      html = render(show_live)
      assert html =~ "Bridge updated successfully"
      assert html =~ "some updated type"
    end
  end
end
