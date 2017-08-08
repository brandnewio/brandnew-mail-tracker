defmodule BrandnewMailTracker.SentMail do
  use BrandnewMailTracker.Web, :model

  schema "sent_mails" do
    field :token, :string
    field :opened, :boolean, default: false
    field :clicked, :boolean, default: false
    belongs_to :mail_category, BrandnewMailTracker.MailCategory

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:token, :opened, :clicked, :mail_category_id])
    |> validate_required([:token, :opened, :clicked, :mail_category_id])
  end
end
