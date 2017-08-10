Types::ValidationErrorType = GraphQL::ObjectType.define do
  name 'ValidationError'

  field :attribute, !types.String do
    resolve ->(obj, _arg, _ctx) { obj.first.to_s.camelize(:lower) }
  end

  field :message, !types.String do
    resolve ->(obj, _arg, _ctx) { obj.second.map { |elm| elm[:error] }.join(', ') }
  end
end
