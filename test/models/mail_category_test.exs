defmodule BrandnewMailTracker.MailCategoryTest do
  use BrandnewMailTracker.ModelCase

  alias BrandnewMailTracker.MailCategory

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = MailCategory.changeset(%MailCategory{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = MailCategory.changeset(%MailCategory{}, @invalid_attrs)
    refute changeset.valid?
  end
end
