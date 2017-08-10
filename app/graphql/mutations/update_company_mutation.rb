Mutations::UpdateCompanyMutation = GraphQL::Relay::Mutation.define do
  name 'UpdateCompany'
  description 'Update a company record'

  input_field :id, !types.Int
  input_field :name, types.String
  input_field :catchPhrase, types.String

  return_field :company, Types::CompanyType
  return_interfaces [Interfaces::MutationResultInterface]

  resolve ->(_obj, inputs, _ctx) {
    comp              = Company.find(inputs[:id])
    comp.name         = inputs[:name] if inputs[:name]
    comp.catch_phrase = inputs[:catchPhrase] if inputs[:catchPhrase]
    comp.save

    {
      company: comp.errors.none? ? comp : nil,
      success: comp.errors.none?,
      errors:  comp.errors.details.to_a
    }
  }
end
