
#ImportFeedService.new(feed_id).perform

class ImportFeedService

  attr_reader :feed

  def initialize(feed_id)
    @feed = Feed.find(feed_id)
  end

  def perform
      feed_content = Feedjira::Feed.fetch_and_parse(feed.url)
      feed_content.entries.each do |entry|
        import(entry)
      end
      puts "Synced Feed: #{feed.name}"
  rescue => e
      # Feed is probably unreacheable
      Rails.logger.error "Something went wrong with: #{feed}"
      Rails.logger.error e.message
      Rails.logger.error e.backtrace.join("\n")
  end

private

  def import(entry)
    temp_entry = feed.entries.where(g_id: entry.entry_id).first_or_initialize
    # Update only if entry is new or publishing date has changed
    if temp_entry.published != entry.published
        temp_entry.attributes ={  title: entry.title,
                                  content: entry.try(:summary),
                                  url: entry.url,
                                  published: entry.published,
                                  g_id: entry.entry_id }
        # Fails silently if entry is invalid & returns false, otherwise saves the entry
        unless temp_entry.save
          Rails.logger.error "Entry: #{entry.title}, for Feed: #{feed.name} is invalid and won't be saved!"
          Rails.logger.error entry
        end
    end
    puts "Synced Entry: #{entry.title}"
  end

end
