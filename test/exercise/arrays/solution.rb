module Exercise
  module Arrays
    class << self
      def replace(array)
        max_num = get_max_num(array)
        array.map { |num| num.positive? ? max_num : num }
      end

      def get_max_num(array)
        max_num = array[0]
        array.each { |num| max_num = num if num > max_num }
        max_num
      end

      def search(array, query)
        binary_search = lambda { |left, right|
          return -1 if left > right

          mid = (left + right) / 2

          return mid if array[mid] == query

          left = mid + 1 if array[mid] < query
          right = mid - 1 if array[mid] > query

          binary_search.call(left, right)
        }
        binary_search.call(0, array.length - 1)
      end
    end
  end
end
