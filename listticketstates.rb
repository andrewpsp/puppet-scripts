#!/usr/bin/env ruby
# This script will loop through ARGV and list the ticket statuses.

require 'rubygems'

begin
  require File.expand_path("~/working/git/puppet/priv/lighthouse-config")
rescue => e
  p e
  Kernel.exit(-1)
end

debug = false
tickets = [ ]

# Must pass git checkout
if ARGV[0].nil? or ARGV[0].empty?
  abort "You need to pass at least one ticket number"
end

# Loop through argv, get ticket states
ARGV.each do |ticket_number|
  next if ticket_number.nil? or ticket_number.empty?
  ticket_number = ticket_number.to_i

  ticket = Lighthouse::Ticket.find(ticket_number, :params => { :project_id => 41389 })

  if !ticket.nil? then tickets << ticket end
end

# Print results
tickets.each do |ticket|
  printf "%8s %20s %s\n", ticket.number.to_s, ticket.state, ticket.title
end

#vim: set expandtab ts=2 sw=2:
