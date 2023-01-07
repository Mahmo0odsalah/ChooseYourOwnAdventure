## A player class holds information related to a certain player, ultimately, each choice made in a situation directly affects a player instance, which means a player's progress can be saved by only saving that player instance's Data

## TODO: Switch to a filesystem db instead of saving states in memory

## TODO: Implement loading/continuing a game

class Player
  def initialize(gender)
    @gender = gender
    @timeline = 1
    @subtimeline = 1
    @situation = 1
    ## TODO: Replace the above 3 with a reference to current situation
    @stats = {
      luck: 0,
      health: 10,
      intelligence: 0,
      wealth: 0,
      strength: 0,
      social_skills: 0,
      independence: 0
    }
  end

  attr_accessor :name
  attr_accessor :gender
  attr_accessor :country
  attr_accessor :timeline
  attr_accessor :subtimeline
  attr_accessor :situation
  attr_reader :stats

  def state
    {
      timeline: @timeline,
      situation: @situation,
      stats: @stats
    }
  end

  def offset_stat(stat_name, value)
    @stats[stat_name] += value
  end
end
