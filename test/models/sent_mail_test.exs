defmodule BrandnewMailTracker.SentMailTest do
  use BrandnewMailTracker.ModelCase

  alias BrandnewMailTracker.SentMail

  @valid_attrs %{clicked: true, opened: true, token: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = SentMail.changeset(%SentMail{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = SentMail.changeset(%SentMail{}, @invalid_attrs)
    refute changeset.valid?
  end
end
