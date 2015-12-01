require_relative 'search_service'
require_relative 'search_criteria'

class Search
  def self.by(params)
    criteria = make_criteria(params)
    ids = SearchService.search_by(criteria)
    find_by_ids(ids)
  end

  def self.make_criteria(params)
    criteria = SearchCriteria.new
    criteria.by_page = params[:results_per_page] || 15
    criteria.category = params[:category]

    if params[:search_type] == :promotional
      criteria.category = :in_promotion
      criteria.order_by = :most_recently
    elseif params[:search_type] == :by_category
      if params[:category]
        criteria,order_by = params[:order_by] || :most_recently
      else # back to normal search
        criteria.order_by = params[:order_by] || revelance
      end
    else # normal search
      criteria.order_by = params[:order_by] || :relevance
      criteria.category = :all
    end
    criteria
  end

end