module Sinatra
  module AssetPipeline

    class AssetInspector

      def initialize(project_path, asset_locations = ['app', 'lib', 'vendor'], assets_directory = "assets") # FIXME: refactor to options hash with defaults
        @project_path    = project_path
        @asset_locations = asset_locations
        @asset_directory = assets_directory
        @asset_paths     = []

        determine_asset_paths
      end

      def paths
        @asset_paths
      end

      private

      def determine_asset_paths
        @asset_locations.each do |location|
          Dir[File.join(@project_path, location, @asset_directory, '*')].each { |path| @asset_paths << path }
        end
      end

    end

  end
end