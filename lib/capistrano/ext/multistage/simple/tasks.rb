require 'capistrano'
require 'capistrano/ext/multistage'

module Capistrano
  module Ext
    module Multistage
      module Simple
        module Tasks
          def self.load_into(configuration)
            configuration.load do
              # Stage specific callbacks
              set :stage_callbacks, {}

              # Helper method to run a block of code for one or more stages
              def in_stage(*stages, &block)
                stages.each do |stage_name|
                  (stage_callbacks[stage_name] ||= []) << block
                end
              end

              # Helper method to run a block of code for all stages
              def in_all_stages(&block)
                in_stage(*stages) do 
                  yield
                end
              end

              # Task to run stage specific callbacks
              namespace :local do
                task :trigger_stage_callbacks do 
                  (stage_callbacks[stage] || []).each { |b| b.call() }
                end
              end

              stages.each { |stage| after stage, "local:trigger_stage_callbacks" }
            end
          end
        end
      end
    end
  end
end

if Capistrano::Configuration.instance
  Capistrano::Ext::Multistage::Simple::Tasks.load_into(Capistrano::Configuration.instance)
end


