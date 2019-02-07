range = (1..Float::INFINITY)
values_lazy = range.lazy.map { |i| i * i }.take(10)
#<Enumerator::Lazy: #<Enumerator::Lazy: #<Enumerator::Lazy: 1..Infinity>:map>:take(10)>

values_lazy.force
# [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
