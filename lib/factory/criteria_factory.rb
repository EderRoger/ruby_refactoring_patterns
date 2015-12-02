class CriteriaFactory

  def self.make_criteria(params)
    if params[:search_type] == :promotional
      make_promotional(params)
    elseif params[:search_type] == :by_category
      make_by_category(params)
    else # normal search
      make_normal_search(params)
    end
  end

  def self.make_promotional(params)
    criteria = SearchCriteria.new
    criteria.by_page = params[:results_per_page] || 15
    criteria.category = :in_promotion
    criteria.order_by = :most_recently
    criteria
  end

  def self.make_by_category(params)
    criteria = SearchCriteria.new
    if params[:category]
      criteria.order_by = params[:order_by] || :most_recently
    else # back to normal search
      criteria.order_by = params[:order_by] || revelance
    end
  end

  def self.make_normal_search(params)
    criteria = SearchCriteria.new
    criteria.order_by = params[:order_by] || :relevance
    criteria.category = :all
  end

end
