class Project
  module Suggestable
    def track_term_for(query)
      previous_suggestion = SearchSuggestion.where(project: self).last
      previous_suggestion.destroy if previous_suggestion && deletable?(previous_suggestion.term, by: query)

      matching_terms = SearchSuggestion.where("term iLIKE :query", query: "%#{query}%").where(project: self)
      SearchSuggestion.create!(term: query, project: self) if matching_terms.count.zero?
    end

    def deletable?(string, by:) # rubocop:disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
      arr = []
      by.split.map(&:downcase).each do |word|
        arr << string.downcase.scan(word)
      end
      arr = arr.flatten.map(&:downcase)

      return false if string.length == by.length

      if string.length > by.length
        string.split.map(&:downcase).all? { |ele| arr.include?(ele.downcase) }
      else
        arr.all? { |ele| by.split.map(&:downcase).include?(ele) }
      end
    end
  end
end
