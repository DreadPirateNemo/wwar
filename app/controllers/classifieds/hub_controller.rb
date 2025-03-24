module Classifieds
  class HubController < ApplicationController
    allow_unauthenticated_access only: [:index, :show]

    def index
    end
  end
end