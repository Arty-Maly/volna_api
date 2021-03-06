defmodule VolnaApi.HealthCheckControllerTest do
  use VolnaApi.ConnCase

  alias VolnaApi.HealthCheck
  @valid_attrs %{}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, health_check_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing healthchecks"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, health_check_path(conn, :new)
    assert html_response(conn, 200) =~ "New health check"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, health_check_path(conn, :create), health_check: @valid_attrs
    assert redirected_to(conn) == health_check_path(conn, :index)
    assert Repo.get_by(HealthCheck, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, health_check_path(conn, :create), health_check: @invalid_attrs
    assert html_response(conn, 200) =~ "New health check"
  end

  test "shows chosen resource", %{conn: conn} do
    health_check = Repo.insert! %HealthCheck{}
    conn = get conn, health_check_path(conn, :show, health_check)
    assert html_response(conn, 200) =~ "Show health check"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, health_check_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    health_check = Repo.insert! %HealthCheck{}
    conn = get conn, health_check_path(conn, :edit, health_check)
    assert html_response(conn, 200) =~ "Edit health check"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    health_check = Repo.insert! %HealthCheck{}
    conn = put conn, health_check_path(conn, :update, health_check), health_check: @valid_attrs
    assert redirected_to(conn) == health_check_path(conn, :show, health_check)
    assert Repo.get_by(HealthCheck, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    health_check = Repo.insert! %HealthCheck{}
    conn = put conn, health_check_path(conn, :update, health_check), health_check: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit health check"
  end

  test "deletes chosen resource", %{conn: conn} do
    health_check = Repo.insert! %HealthCheck{}
    conn = delete conn, health_check_path(conn, :delete, health_check)
    assert redirected_to(conn) == health_check_path(conn, :index)
    refute Repo.get(HealthCheck, health_check.id)
  end
end
