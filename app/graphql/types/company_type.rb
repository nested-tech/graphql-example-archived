Types::CompanyType = GraphQL::ObjectType.define do
  name 'Company'

  field :id, !types.ID
  field :name, !types.String
  field :catchPhrase, types.String do
    resolve ->(obj, _arg, _ctx) { obj.catch_phrase }
  end
end
