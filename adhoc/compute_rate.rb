# frozen_string_literal: true

require "csv"
require "fileutils"

# Purpose: Calculates second lowest silver plan cost from CSV
# Input: Reads from slcsp/slcsp.csv, a CSV with two header columns: zipcode (filled) and rate (empty)
# Output: Writes to STDOUT and slcsp/slcsp.csv, overrides the original CSV with two filled columns: zipcode and rate
# Notes:
class ComputeRate
  ZIPS_FILE_PATH = "slcsp/zips.csv"
  PLANS_FILE_PATH = "slcsp/plans.csv"
  SLCSP_FILE_PATH = "slcsp/slcsp.csv"
  INTERMEDIARY_SLCSP_FILE_PATH = "slcsp/slcsp_temp.csv"
  ORIGINAL_SLCSP_FILE_PATH = "slcsp/slcsp_original.csv"
  HEADERS = ["zipcode", "rate"].freeze

  def self.run(logging = false)
    new.run(logging)
  end

  def initialize
    # NOTE: These would ideally be cached in a production system instead of stored in memory
    @rate_area_to_rate = Hash.new { |hash, key| hash[key] = [] }
    @rate_area_to_slcsp = {}
    @zipcode_to_rate = {}
  end

  def run(logging = false)
    @logging = logging

    log "Starting run"

    map_rate_area_to_rate

    map_rate_area_to_slcsp

    map_zipcode_to_rate

    write_zipcode_to_rate

    log "Finished run"

    # TODO: output slcsp sheet regardless of @logging
  end

  private

  def log(msg)
    puts msg if @logging
  end

  def map_rate_area_to_rate
    log "Running map_@rate_area_to_rate"

    CSV.foreach(PLANS_FILE_PATH, headers: true, header_converters: :symbol) do |row|
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

    CSV.foreach(ZIPS_FILE_PATH, headers: true, header_converters: :symbol) do |row|
      zipcode = row[:zipcode]
      rate_area = format_rate_area(row[:state], row[:rate_area])

      rate = @rate_area_to_slcsp[rate_area]

      if @zipcode_to_rate[zipcode].nil?
        @zipcode_to_rate[zipcode] = rate
      else
        # Means this zipcode is assigned to two rate areas and is therefore ambiguous
        @zipcode_to_rate[zipcode] = false
      end
    end

    log "map_zipcode_to_rate is: #{@zipcode_to_rate}"

    log "Finished running map_zipcode_to_rate"

    @zipcode_to_rate
  end

  def write_zipcode_to_rate
    log "Running write_zipcode_to_rate"

    rows_to_write = []

    CSV.foreach(SLCSP_FILE_PATH, headers: true, header_converters: :symbol) do |row|
      zipcode = row[:zipcode]
      rate = @zipcode_to_rate[zipcode] || nil # convert false to nil

      row_to_write = [zipcode, rate]

      # This needs to not use log because it should always output
      puts row_to_write.join(",")

      rows_to_write << row_to_write
    end

    unless File.exists?(ORIGINAL_SLCSP_FILE_PATH)
      FileUtils.cp(SLCSP_FILE_PATH, ORIGINAL_SLCSP_FILE_PATH)
    end

    headers_set = false
    CSV.open(INTERMEDIARY_SLCSP_FILE_PATH, "wb", headers: HEADERS, write_headers: true) do |csv|
      rows_to_write.each do |row|
        csv << row
      end
    end

    FileUtils.cp(INTERMEDIARY_SLCSP_FILE_PATH, SLCSP_FILE_PATH)
    FileUtils.rm(INTERMEDIARY_SLCSP_FILE_PATH)

    log "Finished running log write_zipcode_to_rate"
  end
end

# We'd normally use logging levels based on current env (dev/staging/prod)
logging = false
ComputeRate.run(logging)
