require 'spec_helper'

context 'for normal search' do
  it 'return normal values' do
    params = {product: 'any product'}
    criteria = Search.make_criteria(params)
    expect(criteria.by_page).to eq(15)
    expect(criteria.order_by).to eq(:relevance)
    expect(criteria.category).to eq(:all)
  end
end
