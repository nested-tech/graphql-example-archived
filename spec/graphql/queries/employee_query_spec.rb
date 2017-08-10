# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Types::EmployeeType' do
  subject do
    GraphqlSchema.execute(query, context: {}, variables: {})
  end

  let(:employee) { create(:employee) }

  describe 'querying for a employee and their company' do
    let(:query) do
      %`
        {
          employee(id: #{employee.id}) {
            email
            company {
              name
            }
          }
        }
      `
    end

    it 'returns the employee and their company' do
      expect(subject.dig('data', 'employee')).to include('email' => employee.email)
      expect(subject.dig('data', 'employee', 'company', 'name')).to eq(employee.company.name)
    end
  end
end
