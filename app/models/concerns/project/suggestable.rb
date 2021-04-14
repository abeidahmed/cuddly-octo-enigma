class Project
  module Suggestable
    def track_term_for(query)
      last_suggestion = SearchSuggestion.where(project: self).last
      last_suggestion.destroy if last_suggestion && deletable?(last_suggestion.term, with_string: query)

      matching_terms = SearchSuggestion.where("term iLIKE :query", query: "%#{query}%").where(project: self)
      SearchSuggestion.create!(term: query, project: self) if matching_terms.count.zero?
    end

    private

    def deletable?(string, with_string:)
      return false if string.length == with_string.length

      same_starting_characters?(string, with_string)
    end

    def same_starting_characters?(string, with_string)
      regex = "^a-zA-Z"

      stripped_string = string.downcase.delete(regex)
      stripped_with_string = with_string.downcase.delete(regex)
      stripped_with_string.start_with?(stripped_string)
    end
  end
end
