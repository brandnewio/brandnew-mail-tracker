defmodule BrandnewMailTracker.MailCategoryController do
  use BrandnewMailTracker.Web, :controller

  alias BrandnewMailTracker.MailCategory

  def index(conn, _params) do
    mail_categories = Repo.all(MailCategory)
    render(conn, "index.html", mail_categories: mail_categories)
  end

  def show(conn, %{"id" => id}) do
    mail_category = Repo.get!(MailCategory, id) |> Repo.preload([:sent_mails])
    sent_count = length(mail_category.sent_mails)
    open_rate = MailCategory.open_rate(mail_category)
    click_rate = MailCategory.click_rate(mail_category)
    render(
      conn,
      "show.html",
      sent_count: sent_count,
      open_rate: open_rate,
      click_rate: click_rate,
      mail_category: mail_category
    )
  end
end
