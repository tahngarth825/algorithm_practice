# frozen_string_literal: true

require 'csv'

# Purpose: Calculates second lowest silver plan cost from CSV
# Input: Reads from slcsp/slcsp.csv, a CSV with two header columns: zipcode (filled) and rate (empty)
# Output: Writes to STDOUT and slcsp/slcsp.csv, overrides the original CSV with two filled columns: zipcode and rate
# Notes:
class ComputeRate
  def self.run(logging = false)
    new.run(logging)
  end

  def initialize(logging)
    @logging = logging

    # NOTE: These would ideally be cached in a production system instead of stored in memory
    @rate_area_to_rate = Hash.new { |hash, key| hash[key] = [] }
    @rate_area_to_slcsp = Hash.new { |hash, key| hash[key] = [] }
    @zipcode_to_rate = Hash.new { |hash, key| hash[key] = [] }
  end

  def run
    log "Starting run"

    map_rate_area_to_rate

    map_rate_area_to_slcsp

    map_zipcode_to_rate

    # TODO: Write to slcsp

    log "Finished run"

    # TODO: output slcsp sheet regardless of @logging
  end

  private

  def log(msg)
    puts msg if @logging
  end

  def map_rate_area_to_rate
    log "Running map_@rate_area_to_rate"

    CSV.foreach("slcsp/plans.csv", headers: true, header_converters: :symbol) do |row|
      metal_level = row[:metal_level]

      # We only care about silver plans
      next unless metal_level == "Silver"

      rate = format_rate(row[:rate])

      # If value was not valid float, then skip
      next unless rate

      rate_area = format_rate_area(row[:state], row[:rate_area])

      @rate_area_to_rate[rate_area] << rate
    end

    log "rate_area_to_rate is: #{@rate_area_to_rate}"

    log "Finished running map_@rate_area_to_rate"

    @rate_area_to_rate
  end

  def format_rate(rate)
    Float(rate)
  rescue
    # Return nil if cannot be cast to float
  end

  def format_rate_area(state, area)
    state + " " + area
  end

  def map_rate_area_to_slcsp
    log "Running map_rate_area_to_slcsp"

    @rate_area_to_rate.each do |rate_area, rate|
      next if rate.empty?

      sorted_distinct_rates = rate.uniq.sort

      # Require two entries
      next if sorted_distinct_rates.length < 2

      # NOTE: Instructions state to use two digits after decimal
      # But they do not specify whether to truncate or round
      # As such, I've opted to round as a reasonable assumption
      formatted_second_lowest_rate = sprintf("%.2f", sorted_distinct_rates[1].round(2))

      @rate_area_to_slcsp[rate_area] = formatted_second_lowest_rate
    end

    log "rate_area_to_slcsp is: #{@rate_area_to_slcsp}"

    log "Finished running map_rate_area_to_slcsp"

    @rate_area_to_slcsp
  end

  def map_zipcode_to_rate
    log "Running map_zipcode_to_rate"

    CSV.foreach("slcsp/zips.csv", headers: true, header_converters: :symbol) do |row|
      zipcode = row[:zipcode]
      rate_area = format_rate_area(row[:state], row[:rate_area])

      rate = rate_area_to_slcsp[]

      zipcode_to_rate[zipcode] =
    end

    log "map_zipcode_to_rate is: #{@map_zipcode_to_rate}"

    log "Finished running map_zipcode_to_rate"

    @rate_area_to_rate
  end
end

ComputeRate.run
