Types::EmployeeType = GraphQL::ObjectType.define do
  name 'Employee'

  field :id, !types.ID
  field :firstName, !types.String do
    resolve ->(obj, _arg, _ctx) { obj.first_name }
  end
  field :lastName, !types.String do
    resolve ->(obj, _arg, _ctx) { obj.last_name }
  end
  field :age, types.Int
  field :email, types.String

  field :company, Types::CompanyType
end
