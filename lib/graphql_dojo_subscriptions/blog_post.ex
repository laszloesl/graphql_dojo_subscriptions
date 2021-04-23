defmodule GraphqlDojoSubscriptions.BlogPost do
  use Ecto.Schema
  import Ecto.Changeset

  schema "blog_posts" do
    field(:author, :string, null: false)
    field(:title, :string, null: false)
    field(:text, :string, null: false)
    timestamps()
  end

  @fields [:author, :title, :text]

  @doc false
  def changeset(blog_post, attrs) do
    blog_post
    |> cast(attrs, @fields)
    |> validate_required(@fields)
  end

  def insert(attrs) do
    changeset = changeset(%__MODULE__{}, attrs)
    GraphqlDojoSubscriptions.Repo.insert(changeset)
  end

  def get(id) do
    GraphqlDojoSubscriptions.Repo.get(__MODULE__, id)
  end
end
