class ControlController < ApplicationController
  def create_account
    first = params['fname']
    last = params['lname']
    email = params['email']
    preferences = params['preferences']
    location = params['location']
    p = Profile.new
    p.fname = first
    p.lname = last
    p.email = email
    #p.preferences = JSON.parse(preferences)
    #p.preferences = ActiveSupport::JSON.decode(preferences)
    #may happen in another function
    p.save
    group = Group.find_or_initialize_by(location: location)
    prefs = JSON.parse(group.preferences)
    curr_prefs = JSON.parse(preferences)
    #prefs may happen in another function
    prefs.push(curr_prefs)
    group.preferences = prefs.stringify(prefs)
    group.save
  end

  def get_daily
    location = params['location']
    #Get the restaurant from yelp
    group = Group.find(location: location)
    group.interested = 0
    group.selected = nil #Will be restaurant ID
    returnn nil #will be restaurant
  end

  def set_prefs
    #will be added from create if necessary
  end

  def people_interested
    location = params['location']
    group = Group.find(location: location)
    group.interested += 1
    #if needed we can add controllers for specific numbers besides returning interested
  end
end
