Types::CompanyType = GraphQL::ObjectType.define do
  name 'Company'

  field :id, !types.ID
  field :name, !types.String
  field :catchPhrase, types.String do
    resolve ->(obj, _arg, _ctx) { obj.catch_phrase }
  end

  field :employees, types[Types::EmployeeType] do
    argument :limit, types.Int
    resolve ->(obj, args, _ctx) {
      employees = obj.employees
      employees = employees.limit(args[:limit]) if args[:limit]
      employees
    }
  end
end
