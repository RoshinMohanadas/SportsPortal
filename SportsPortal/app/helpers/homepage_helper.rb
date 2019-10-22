module HomepageHelper
    def event_groups
        Eventgroup.all
    end

    def all_matches
        Match.all
    end
end
