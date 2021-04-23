defmodule GraphqlDojoSubscriptions.Repo.Migrations.CreateBlogPosts do
  use Ecto.Migration

  def change do
    create table(:blog_posts) do
      add(:author, :string)
      add(:title, :string)
      add(:text, :string)
      timestamps()
    end

  end
end
