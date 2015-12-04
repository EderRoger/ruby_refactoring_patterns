class ElasticSearchFactory
  @@configuration = {
    host: 'elasticsearch.myhost.com',
    port: '4004',
    timeout: 10
  }

  def self.promotional; end
  def self.by_category; end
  def self.normal; end
end
