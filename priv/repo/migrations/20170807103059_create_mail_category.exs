defmodule BrandnewMailTracker.Repo.Migrations.CreateMailCategory do
  use Ecto.Migration

  def change do
    create table(:mail_categories) do
      add :name, :string

      timestamps()
    end

  end
end
