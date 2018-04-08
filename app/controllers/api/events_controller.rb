module Api
  class EventsController < ApplicationController
    def create
      event = CreateEventRequest.new(params).create
      # TODO: add show/index methods for events and then change this location field
      render status: :created, location: event.id.to_s
    end

    def update
    end
  end
end
