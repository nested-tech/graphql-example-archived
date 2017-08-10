# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Mutations::CreateCompanyMutation' do
  subject do
    GraphqlSchema.execute(query, context: {}, variables: {})
  end

  describe 'with valid attributes' do
    let(:query) do
      %`
        mutation {
          createCompany(input: { name: "KFC", catchPhrase: "Finger Lickin' Good" }) {
            success
            company {
              name
            }
          }
        }
      `
    end

    it 'creates a company' do
      expect { subject }.to change { Company.count }.from(0).to(1)
    end

    it 'returns the requested data' do
      expect(subject.dig('data', 'createCompany', 'company', 'name')).to_not be_nil
    end

    it 'indicates that the transaction was a success' do
      expect(subject.dig('data', 'createCompany', 'success')).to eq(true)
    end
  end

  describe 'with invalid input attributes' do
    let(:query) do
      %`
        mutation {
          createCompany(input: { catchPhrase: "Finger Lickin' Good" }) {
            success
            errors {
              attribute
              message
            }
            company {
              name
            }
          }
        }
      `
    end

    it 'does not create a company' do
      expect { subject }.to_not(change { Company.count })
    end

    it 'raises a GraphQL (schema) level error' do
      resp = subject['errors']

      expect(resp).to be_a(Array)
      expect(resp.first['message']).to include("Argument 'input' on Field 'createCompany' has an invalid value.")
    end
  end
end
