defmodule BrandnewMailTracker.SentMailController do
  use BrandnewMailTracker.Web, :controller

  alias BrandnewMailTracker.SentMail
  alias BrandnewMailTracker.MailCategory

  import Ecto.Query

  def create(conn, %{"sent_mail" => sent_mail_params}) do
    q = from cat in MailCategory, where: cat.name == ^sent_mail_params["name"]
    category = Repo.one(q)

    if category == nil do
      changeset = MailCategory.changeset(%MailCategory{}, %{"name" => sent_mail_params["name"]})
      {:ok, category} = Repo.insert(changeset)
    end

    q = from mail in SentMail, where: mail.token == ^sent_mail_params["token"], select: mail.id
    if Repo.all(q) == [] do
      changeset = SentMail.changeset(
        %SentMail{}, %{"mail_category_id" => category.id, "token" => sent_mail_params["token"]}
      )
      Repo.insert(changeset)
    end

    text conn, "OK"
  end

  def open(conn, %{"token" => token}) do
    q = from mail in SentMail, where: mail.token == ^token
    sent_mail = Repo.one(q)
    changeset = SentMail.changeset(sent_mail, %{"opened" => true})
    Repo.update(changeset)
    text conn, "OK"
  end

  def click(conn, %{"token" => token}) do
    q = from mail in SentMail, where: mail.token == ^token
    sent_mail = Repo.one(q)
    changeset = SentMail.changeset(sent_mail, %{"opened" => true, "clicked" => true})
    Repo.update(changeset)
    text conn, "OK"
  end
end
