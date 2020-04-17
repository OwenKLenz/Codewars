# Your task is to implement a function that calculates an election winner from a list of voter selections using an Instant Runoff Voting algorithm. If you haven't heard of IRV, here's a basic overview (slightly altered for this kata):

# - Each voter selects several candidates in order of preference.
    
# - The votes are tallied from the each voter's first choice.

# - If the first-place candidate has more than half the total votes, they win.

# - Otherwise, find the candidate who got the least votes and remove them from each person's voting list.
    
# - In case of a tie for least, remove all of the tying candidates.
    
# - In case of a complete tie between every candidate, return nil(Ruby)/None(Python)/undefined(JS).
    
# - Start over.
    
# - Continue until somebody has more than half the votes; they are the winner.

# - Your function will be given a list of voter ballots; each ballot will be a list of candidates (symbols) in descending order of preference. You should return the symbol corresponding to the winning candidate. See the default test for an example!

# Input: 
# - array of arrays
# Output: 
# - one value out of array or nil

# Requirements:
# - take arr of arr as arg
# - each sub array contains same potential values (arr1.sort == arr2.sort)
# - each value will be a symbol

# Rules:
# - index order of arr are in descending preference (top choice first etc)
# - find option with more than 50% first place
#   - if no such option exists, remove candidate/candidates with fewest 1st place votes (look for ties)
# Find first place and last place candidate
#     remove every instance of last place from all subarrays
# - repeat until one candidate has more than 50% or there is a tie
# # - tie = no voter has more than 50%; two choices have same count of votes

# Data Structure:
# - nested array
# tallies by round for each cand
# what is the cutoff for victory (50%?)
#   Track Total # of votes
# hash for tallies each round
#   {:dem => {tally: int, percent: float :rep => percent}}
  
  
# Algorithm:
#   init total_votes (set to total number of ballots)
#   Create candidate_hash
#     iterate over first ballot, initialize a hash with keys for each candidate, value = nil
    
#   iterate over candidates
#     count the number of votes
    
# #  In case of emergency
# #    num_of_first_place_votes = candidates.each { ballots.select { |ballot| ballot[0] == candidate } }
    
#     voters.each do |ballot|
#       candidates[ballot.first[:votes]] += 1
    
#     iterating through candidates 
#      - calc perc
     
#     select candidate with > 50% 
#       if no candidate
#       find candidate with lowest percent      
#     - remove as necessary or declare winner   
    
#   iterate over first place votes on each ballot
#     increment candidate tally for each appearance on ballot
  
#   - if candidate(s) is removed - removed from hash
def initialize_candidates(ballot)
  new_hash = Hash.new
  ballot.each { |candidate| new_hash[candidate] = {votes: 0, percentage: nil} }
  new_hash
end

def tally_votes(ballots, candidates)
  ballots.each do |ballot|
    candidates[ballot[0]][:votes] += 1
  end
end

def calculate_percent_of_votes(candidates, total_votes)
  candidates.each_key do |candidate|
    percentage = candidates[candidate][:votes].to_f / total_votes
    candidates[candidate][:percentage] = percentage
  end
end

def compare_percents(candidates)
  candidates.map { |candidate, numbers| numbers[:percentage] }.uniq.one?
end


def find_last_place_candidates(candidates)
  lowest_percentage = candidates.first[1][:percentage]
  
  candidates.take_while do |candidate, numbers|
    numbers[:percentage] == lowest_percentage
  end
end

def remove_losers(ballots, last_place)
  last_place.each do |candidate, _|
    ballots.each { |ballot| ballot.delete(candidate) }
  end
end

def runoff(voters)
  loop do
    total_votes = voters.size

    candidates = initialize_candidates(voters.first)

    tally_votes(voters, candidates)

    calculate_percent_of_votes(candidates, total_votes)

    candidates.each do |candidate, numbers|
      return candidate if numbers[:percentage] > 0.5
    end

    sorted_cand = candidates.sort_by do |candidate, numbers|
      numbers[:percentage]
    end

    return nil if compare_percents(candidates)

    last_place = find_last_place_candidates(sorted_cand)

    remove_losers(voters, last_place)
  end
end

# # Test Cases:
# voters = [[:dem, :rep, :ind, :aaaaaaah!], 
#           [:rep, :dem, :ind], 
#           [:dem, :rep, :ind],
#           [:aaaaaaah!, :ind, :dem],
#           [:ind, :rep, :dem]]

# p runoff(voters)

# simple tie
# voters = [[:dem, :rep], 
#           [:rep, :dem]]

# p runoff(voters)

# voters = [[:ind, :dem, :rep],
#           [:rep, :dem, :ind],
#           [:dem, :ind, :rep],
#           [:dem, :rep, :ind]]


# p runoff(voters) == :dem
    

# # intial test
# voters = [[:dem, :ind, :rep],
#           [:rep, :ind, :dem],
#           [:ind, :dem, :rep],
#           [:ind, :rep, :dem]]

# p runoff(voters) == :ind

# # reorder
# voters = [[:ind, :dem, :rep],
#           [:rep, :dem, :ind],
#           [:dem, :ind, :rep],
#           [:dem, :rep, :ind]]

# runoff(voters) == :dem

# # empty arg
# voters = []
# runoff(voters) == nil

# equal counts return nil
# voters = [[:dem, :ind,:rep],
#           [:ind, :dem,:rep],
#           [:dem, :ind,:rep],
#           [:ind, :dem,:rep],
#           [:dem, :ind,:rep],
#           [:ind, :dem,:rep],
#           [:dem, :ind,:rep],
#           [:ind, :dem,:rep]]
# p (runoff(voters) == nil)
# p runoff(voters)
#     # https://en.wikipedia.org/wiki/Instant-runoff_voting