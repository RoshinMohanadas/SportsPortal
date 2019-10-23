module HomepageHelper
    def event_groups
        Eventgroup.all
    end

    def all_matches
        Match.all
    end

    def all_news
        Newsfile.all
    end

end
