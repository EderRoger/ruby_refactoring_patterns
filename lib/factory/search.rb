require_relative 'search_service'
require_relative 'search_criteria'
require_relative 'criteria_factory'

class Search
  def self.by(params)
    criteria = CriteriaFactory.make_criteria(params)
    ids = SearchService.search_by(criteria)
    find_by_ids(ids)
  end

  def self.find_by_ids(ids)
  end
end
