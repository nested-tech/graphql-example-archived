# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Mutations::UpdateCompanyMutation' do
  subject do
    GraphqlSchema.execute(query, context: {}, variables: {})
  end

  let(:old_catch_phrase) { 'Greasy Fried Chicken' }
  let(:new_catch_phrase) { "Finger Lickin' Good" }

  let(:company) { create(:company, name: 'KFC', catch_phrase: old_catch_phrase) }

  describe 'with valid attributes' do
    let(:query) do
      %`
        mutation {
          updateCompany(input: { id: #{company.id} catchPhrase: "#{new_catch_phrase}" }) {
            success
            company {
              name
              catchPhrase
            }
          }
        }
      `
    end

    it 'updates the company' do
      expect { subject }
        .to change { Company.find(company.id).catch_phrase }
        .from(old_catch_phrase)
        .to(new_catch_phrase)
    end

    it 'returns the requested data' do
      expect(subject.dig('data', 'updateCompany', 'company', 'name')).to_not be_nil
      expect(subject.dig('data', 'updateCompany', 'company', 'catchPhrase')).to eq(new_catch_phrase)
    end

    it 'indicates that the transaction was a success' do
      expect(subject.dig('data', 'updateCompany', 'success')).to eq(true)
    end
  end
end
