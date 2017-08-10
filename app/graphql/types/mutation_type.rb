Types::MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  field :createCompany, field: Mutations::CreateCompanyMutation.field
  field :updateCompany, field: Mutations::UpdateCompanyMutation.field
end
