Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  field :company, function: Functions::FindRecord.new(model: Company, type: Types::CompanyType)
  field :employee, function: Functions::FindRecord.new(model: Employee, type: Types::EmployeeType)
end
