require 'thor'

require 'sweet_pickler/config'


module SweetPickler
  class CLI < Thor
    class Project < Thor
      def set *args
        # TODO # append project number to Trackerfile
      end
    end

    def token *args
      # TODO #set the token for this project
    end

    def name *args
      # TODO
    end 

    def show *args
      # TODO
    end

    desc "search [QUERY]", "List all stories matching a query"
    [:label, :type, :state].each do |o|
      method_option o, :type => :string
    end

    [:requester, :owner, :mywork].each do |o|
      method_option o => :string, :default => SweetPickler::Config.real_name
    end

    method_option :includedone => :boolean, :banner => "included accepted stories"
    method_option :"no-includedone" => :boolean, :banner => "do not include accepted stories"

    method_option :backlog => :boolean, :aliases => '-b', :banner => 'filter results to future iterations'
    method_option :current => :boolean, :aliases => '-c', :banner => 'filter results to current iteration'
    method_option :full => :boolean, :banner => 'show full story, not a summary line'
    def search(query)
      # TODO
    end
    
    def comment *args
      # TODO
    end

    class Story < Thor
      desc "Add a feature to the project - it will not create a PT story until pushed"
      def add *args
        # TODO
      end

      desc "Show details for a story"
      method_options :full => :boolean, :banner => 'default format'
      method_options :raw => :boolean, :banner => 'same as the .feature'
      def show(story)
        # fetch the story form pivotal tracker and show it
      end
      
      desc "Upload features as PT stories"
      def push story
        # TODO
      end

      desc "Pull PT stories as features"
      def pull *args
        # TODO
      end
   
      desc "Start a story, pulling it as a feature if it doesn't already exist"
      def start *args
        # TODO
      end
      
      desc "Finish a story - a story cannot be finished unless the feature file exists"
      def finish *args
        # TODO
      end

      desc "Deliver a story - a story cannot be delivered unless the feature file exists"
      method_options :"all-finished" => :boolean, :banner => 'mark all finished stories as delivered'
      def deliver *args
        # TODO
      end

      desc "Mark a story as unstarted, pulling it as a feature if it doesn't already exist" 
      method_options :"all-started" => :boolean, :banner => 'unstart all started stories'
      def unstart *args
        # TODO
      end
      
      desc "Move stories to icebox - tag cucumber features with @icebox"
      def unschedule *args
        # TODO
      end

      desc "Open a story in the webrowser #UNIMPLEMENTED"
      def browse *args
        # TODO
      end
    end
    
    Feature = Story
    
    class Task < Thor
      desc "Add a task to a story"
      def add *args
        # TODO
      end

      def complete *args
        # TODO
      end 
    end
    
    Scenario = Task
  end
end
