# ARCHIVED

---

# An Example GraphQL Service in Ruby

This is an example GraphQL service written in Ruby, using Ruby on Rails and the
[graphql ruby gem].

This was built to accompany a talk at the [LRUG] August 2017 meeting.  The
slides for which can be found here:

https://speakerdeck.com/dazoakley/graphql-and-ruby

## Getting Started

```
bundle install
bundle exec rails db:setup
bundle exec rails server
```

Now head to http://localhost:3000/graphiql to interact with the service.

[graphql ruby gem]: http://graphql-ruby.org
[LRUG]: http://lrug.org
