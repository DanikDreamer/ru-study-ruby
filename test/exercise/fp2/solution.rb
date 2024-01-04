module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&block)
        return self if empty?

        head, *tail = self
        block.call(head)
        MyArray.new(tail).my_each(&block)
        self
      end

      # Написать свою функцию my_map
      def my_map(&block)
        my_reduce(MyArray.new) { |acc, el| acc << block.call(el) }
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(MyArray.new) { |acc, el| el.nil? ? acc : acc << el }
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &block)
        my_each { |el| acc = acc.nil? ? el : block.call(acc, el) }
        acc
      end
    end
  end
end
