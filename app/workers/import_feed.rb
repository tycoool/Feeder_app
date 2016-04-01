# Resque.enqueue(ImportFeed, 12)
# remove the job with exactly the same parameters:
# Resque.remove_delayed(ImportFeed,12)
class ImportFeed
  @queue = :import_feeds

  def self.perform(feed_id)
    ImportFeedService.new(feed_id).perform
  end
end
