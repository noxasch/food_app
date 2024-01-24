class MutationGenerator < Rails::Generators::NamedBase
  desc 'This generator creates an mutation file inside app/mutations'

  def create_mutation_file
    create_file "app/mutations/#{file_path}.rb", <<~RUBY
      class #{class_name} < ApplicationMutation
        required do
        end

        optional do
        end

        protected

        def execute; end

        def validate; end
      end
    RUBY

    create_file "spec/mutations/#{file_path}_spec.rb", <<~RUBY
      RSpec.describe #{class_name}, type: :mutation do
        pending "add some examples to (or delete) #{__FILE__}"
      end
    RUBY
  end
end
