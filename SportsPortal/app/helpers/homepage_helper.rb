module HomepageHelper
    def event_groups
        Eventgroup.all
    end

    def all_matches
        Match.all.order('matchstarttime DESC')
    end

    def all_news
        Newsfile.all
    end

    def all_contents
        Editcontent.all
    end

    def all_downloads
        Download.all
    end

end
