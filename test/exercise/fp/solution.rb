module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        rating = array.reject { |film| film['country'].nil? }
                      .select { |film| film['country'].split(',').length > 1 && film['rating_kinopoisk'].to_f.positive? }
                      .map { |film| film['rating_kinopoisk'].to_f }
        rating.reduce(:+) / rating.size
      end

      def chars_count(films, threshold)
        films.select { |film| film['rating_kinopoisk'].to_f >= threshold }
             .map { |film| film['name'] }
             .reduce(0) { |acc, film| film.count('и') + acc }
      end
    end
  end
end
