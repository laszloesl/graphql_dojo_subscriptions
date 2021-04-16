# GraphqlDojoSubscriptions

Generate this project with:

```
mix phx.new $PROJECT_DIR --no-html --no-ecto --no-webpack --no-gettext --no-dashboard --install
```

Add the two dependencies:

```
{:absinthe, "~> 1.6"},
{:absinthe_phoenix, "~> 2.0"},
```

Create the GraphQL schema `GraphqlDojoSubscriptionsWeb.GraphQL.Schema`.

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

### Setup

You must convert your websocket to an Absinthe socket by adding the line:

```
use Absinthe.Phoenix.Socket, schema: GraphqlDojoSubscriptionsWeb.GraphQL.Schema
```

And your endpoint has to be converted to an `Absinthe.Phoenix.Endpoint`:
```
use Absinthe.Phoenix.Endpoint
```

And you also have to start the subscription in your supervision tree.

```
{Absinthe.Subscription, GraphqlDojoSubscriptionsWeb.Endpoint}
```

The docs published on HexDocs does not state this, so it's better to read the readme in
the `absinthe_phoenix` repo.

### Example subscription

```
subscription {
  sendMeStuff {
    stuff
  }
}
```

Then elsewhere in the code we can publish data and the subscriber will receive it.

```
Absinthe.Subscription.publish(GraphqlDojoSubscriptionsWeb.Endpoint, %{stuff: "message"}, [send_me_stuff: "here_is_some_stuff"])
```

where `GraphqlDojoSubscriptionsWeb.Endpoint` is our `Absinthe.Phoenix` endpoint,
`%{stuff: "message"}` is the actual data, and `[send_me_stuff: "here_is_some_stuff"]`
are basically naming the subscription (`send_me_stuff`) and the topic (`"here_is_some_stuff"`).
If we haven't looked into the code yet, now it's about time.



