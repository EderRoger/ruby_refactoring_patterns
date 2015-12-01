class Search
  def self.by(params)
    criteria = make_criteria(params)
    ids = SearchService.search_by(criteria)
    find_by_ids(ids)
  end
end
