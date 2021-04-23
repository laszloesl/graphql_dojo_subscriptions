# GraphqlDojoSubscriptions

In order to use subscriptions you only have to change a few things in your GraphQL app.
https://hexdocs.pm/absinthe/subscriptions.html is a good starting point.

## GraphQL subscriptions

Subscriptions can be used to receive GraphQL documents in a push-based
manner. The client can open a websocket and subscribe to certain kind
of events through a graphql query. The client can also unsubscribe or
the server may terminate the subscription when an error or a timeout
occurs.

Absinthe (`absinthe_phoenix`) uses `Phoenix.PubSub` in the backend, so
it also works if you have a cluster. The client may subscribe on one
node and it will receive the document regardless of where the triggering
even happens, because it is broadcast in the cluster.
By default `Phoenix.PubSub` uses process groups for
broadcasting, but it's not too difficult to write your own adapter.
See: https://www.erlang-solutions.com/blog/how-to-write-a-phoenix-pubsub-adapter-tutorial-example-based-on-eventstore/

Con: The client has to be able to communicate with Absinthe websockets.
For JS there's a package: `@absinthe/socket`.

We'll check if we can catch some absinthe messages later.

You can also implement the `Absinthe.Subscription.PubSub` behaviour, if
you want to base your subscriptions on something other than `Phoenix.PubSub`.

## Our example

In our example we have an overly simplified system that manages blog posts.
A blog post has an author, a title and some text.
The storage backend is Postgres.

### Example subscription

Currently we can do only one kind of subscription to see newly published posts
of our favourite author:

```
subscription {
  newBlogPosts {
    author
    title
    text
    id
  }
}
```

To test our subscription we can use `Absinthe.Subscription.publish/3`:
```
Absinthe.Subscription.publish(GraphqlDojoSubscriptionsWeb.Endpoint, %{author: "Someone", title: "Very Good Book", text: "Intentionally left blank", id: "555"}, [new_blog_posts: "*", new_blog_posts: "Someone"])
```

Note that we send the data to everyone who is subscribed to all authors (`*`) and anyone who subscribe to the particular author.