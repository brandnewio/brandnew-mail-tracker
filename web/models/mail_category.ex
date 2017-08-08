defmodule BrandnewMailTracker.MailCategory do
  use BrandnewMailTracker.Web, :model

  schema "mail_categories" do
    field :name, :string
    has_many :sent_mails, BrandnewMailTracker.SentMail

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end

  def open_rate(struct) do
    List.foldl(
      struct.sent_mails,
      0,
      fn(mail, acc) -> acc + if mail.opened, do: 1, else: 0 end
    ) / length(struct.sent_mails) * 100
  end

  def click_rate(struct) do
    List.foldl(
      struct.sent_mails,
      0,
      fn(mail, acc) -> acc + if mail.clicked, do: 1, else: 0 end
    ) / length(struct.sent_mails) * 100
  end
end
