GraphqlSchema = GraphQL::Schema.define do
  query(Types::QueryType)
  mutation(Types::MutationType)

  resolve_type ->(object, _ctx) {
    "Types::#{object.class.name}Type".constantize
  }
end
