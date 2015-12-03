require 'spec_helper'

context 'for normal search' do
  it 'return normal values' do
    params = {product: 'any product'}
    criteria = CriteriaFactory.make_criteria(params)
    expect(criteria.by_page).to eq(15)
    expect(criteria.order_by).to eq(:relevance)
    expect(criteria.category).to eq(:all)
  end

  it 'retrieve results by page when informed' do
    params = {
      product: 'any product',
      results_per_page: 20
    }
    criteria = CriteriaFactory.make_criteria(params)
    expect(criteria.by_page).to eq(20)
  end

  describe Search do
    it 'use CriteriaSearch to create search criteria' do
      params = {search_type: :by_category}
      expect(CriteriaFactory).to receive(:make_criteria).with(params)
      Search.by(params)
    end
  end

end
