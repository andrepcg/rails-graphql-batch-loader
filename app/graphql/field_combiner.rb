# frozen_string_literal: true

# This class combines two query types into one. This means that we can split the query type in
# multiple files for better code structure.
class FieldCombiner
  def self.combine(query_types)
    Array(query_types).reduce({}) do |acc, query_type|
      acc.merge!(query_type.fields)
    end
  end
end
