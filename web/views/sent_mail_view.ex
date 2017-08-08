defmodule BrandnewMailTracker.SentMailView do
  use BrandnewMailTracker.Web, :view

  def render("index.json", %{sent_mails: sent_mails}) do
    %{data: render_many(sent_mails, BrandnewMailTracker.SentMailView, "sent_mail.json")}
  end

  def render("show.json", %{sent_mail: sent_mail}) do
    %{data: render_one(sent_mail, BrandnewMailTracker.SentMailView, "sent_mail.json")}
  end

  def render("sent_mail.json", %{sent_mail: sent_mail}) do
    %{id: sent_mail.id,
      mail_category_id: sent_mail.mail_category_id,
      token: sent_mail.token,
      opened: sent_mail.opened,
      clicked: sent_mail.clicked}
  end
end
