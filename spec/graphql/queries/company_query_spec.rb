# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Types::CompanyType' do
  subject do
    GraphqlSchema.execute(query, context: {}, variables: {})
  end

  before do
    @company = create(:company)
    5.times { create(:employee, company: @company) }
  end

  describe 'querying for a company and its employees' do
    let(:query) do
      %`
        {
          company(id: #{@company.id}) {
            name
            catchPhrase
            employees {
              firstName
              lastName
            }
          }
        }
      `
    end

    it 'returns the company and its employees' do
      expect(subject.dig('data', 'company')).to include('name' => @company.name)
      expect(subject.dig('data', 'company', 'employees').size).to eq(5)
    end
  end
end
