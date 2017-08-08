defmodule BrandnewMailTracker.Repo.Migrations.CreateSentMail do
  use Ecto.Migration

  def change do
    create table(:sent_mails) do
      add :token, :string
      add :opened, :boolean, default: false, null: false
      add :clicked, :boolean, default: false, null: false
      add :mail_category_id, references(:mail_categories, on_delete: :nothing)

      timestamps()
    end
    create index(:sent_mails, [:mail_category_id])

  end
end
