defmodule BrandnewMailTracker.SentMailControllerTest do
  use BrandnewMailTracker.ConnCase

  alias BrandnewMailTracker.SentMail
  @valid_attrs %{clicked: true, opened: true, token: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, sent_mail_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    sent_mail = Repo.insert! %SentMail{}
    conn = get conn, sent_mail_path(conn, :show, sent_mail)
    assert json_response(conn, 200)["data"] == %{"id" => sent_mail.id,
      "mail_category_id" => sent_mail.mail_category_id,
      "token" => sent_mail.token,
      "opened" => sent_mail.opened,
      "clicked" => sent_mail.clicked}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, sent_mail_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, sent_mail_path(conn, :create), sent_mail: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(SentMail, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, sent_mail_path(conn, :create), sent_mail: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    sent_mail = Repo.insert! %SentMail{}
    conn = put conn, sent_mail_path(conn, :update, sent_mail), sent_mail: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(SentMail, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    sent_mail = Repo.insert! %SentMail{}
    conn = put conn, sent_mail_path(conn, :update, sent_mail), sent_mail: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    sent_mail = Repo.insert! %SentMail{}
    conn = delete conn, sent_mail_path(conn, :delete, sent_mail)
    assert response(conn, 204)
    refute Repo.get(SentMail, sent_mail.id)
  end
end
