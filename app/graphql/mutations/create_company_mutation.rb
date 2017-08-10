Mutations::CreateCompanyMutation = GraphQL::Relay::Mutation.define do
  name 'CreateCompany'
  description 'Create a company record'

  input_field :name, !types.String
  input_field :catchPhrase, types.String

  return_field :company, Types::CompanyType
  return_interfaces [Interfaces::MutationResultInterface]

  resolve ->(_obj, inputs, _ctx) {
    comp = Company.create(name: inputs[:name], catch_phrase: inputs[:catchPhrase])

    {
      company: comp.errors.none? ? comp : nil,
      success: comp.errors.none?,
      errors:  comp.errors.details.to_a
    }
  }
end
