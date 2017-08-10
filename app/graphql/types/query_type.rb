Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  field :company, function: Functions::FindRecord.new(model: Company, type: Types::CompanyType)
end
