class ImportAllFeeds
  @queue = :import_all_feeds

  def self.perform
    Feed.all.each do |feed|
      ImportFeedService.new(feed.id).perform
    end
  end
end
