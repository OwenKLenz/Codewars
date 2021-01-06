def ulam_sequence(*start_array, size)
  outcome = start_array

  sum_candidate = start_array[-1] + 1

  while outcome.size < size
    pairs = outcome.combination(2).to_a

    if pairs.select { |pair| pair.sum == sum_candidate }.size == 1
      outcome.push(sum_candidate)
    end

    sum_candidate += 1
  end
end
