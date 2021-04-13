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

      arr = common_words_among(string, with_string)
      if string.length > with_string.length
        lowercased_string_array(string).all? { |ele| arr.include?(ele) }
      else
        arr.all? { |ele| lowercased_string_array(with_string).include?(ele) }
      end
    end

    def lowercased_string_array(string)
      string.split.map(&:downcase)
    end

    def common_words_among(first, second)
      lowercased_string_array(second).map { |word| first.downcase.scan(word) }.flatten
    end
  end
end
