# WARNING ABOUT GENERATED CODE
#
# This file is generated. See the contributing for info on making contributions:
# https://github.com/aws/aws-sdk-ruby/blob/master/CONTRIBUTING.md
#
# WARNING ABOUT GENERATED CODE

module Aws
  module IAM
    class Group

      extend Aws::Deprecations

      # @overload def initialize(name, options = {})
      #   @param [String] name
      #   @option options [Client] :client
      # @overload def initialize(options = {})
      #   @option options [required, String] :name
      #   @option options [Client] :client
      def initialize(*args)
        options = Hash === args.last ? args.pop.dup : {}
        @name = extract_name(args, options)
        @data = options.delete(:data)
        @client = options.delete(:client) || Client.new(options)
      end

      # @!group Read-Only Attributes

      # @return [String]
      def name
        @name
      end
      alias :group_name :name

      # The path to the group. For more information about paths, see [IAM
      # Identifiers][1] in the *Using IAM* guide.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html
      # @return [String]
      def path
        data.path
      end

      # The stable and unique string identifying the group. For more
      # information about IDs, see [IAM Identifiers][1] in the *Using IAM*
      # guide.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html
      # @return [String]
      def group_id
        data.group_id
      end

      # The Amazon Resource Name (ARN) specifying the group. For more
      # information about ARNs and how to use them in policies, see [IAM
      # Identifiers][1] in the *Using IAM* guide.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html
      # @return [String]
      def arn
        data.arn
      end

      # The date and time, in [ISO 8601 date-time format][1], when the group
      # was created.
      #
      #
      #
      # [1]: http://www.iso.org/iso/iso8601
      # @return [Time]
      def create_date
        data.create_date
      end

      # @!endgroup

      # @return [Client]
      def client
        @client
      end

      # Loads, or reloads {#data} for the current {Group}.
      # Returns `self` making it possible to chain methods.
      #
      #     group.reload.data
      #
      # @return [self]
      def load
        resp = @client.get_group(group_name: @name)
        @data = resp.group
        self
      end
      alias :reload :load

      # @return [Types::Group]
      #   Returns the data for this {Group}. Calls
      #   {Client#get_group} if {#data_loaded?} is `false`.
      def data
        load unless @data
        @data
      end

      # @return [Boolean]
      #   Returns `true` if this resource is loaded.  Accessing attributes or
      #   {#data} on an unloaded resource will trigger a call to {#load}.
      def data_loaded?
        !!@data
      end

      # @!group Actions

      # @param [Hash] options ({})
      # @option options [required, String] :user_name
      #   The name of the user to add.
      #
      #   The [regex pattern][1] for this parameter is a string of characters
      #   consisting of upper and lowercase alphanumeric characters with no
      #   spaces. You can also include any of the following characters: =,.@-
      #
      #
      #
      #   [1]: http://wikipedia.org/wiki/regex
      # @return [EmptyStructure]
      def add_user(options = {})
        options = options.merge(group_name: @name)
        resp = @client.add_user_to_group(options)
        resp.data
      end

      # @param [Hash] options ({})
      # @option options [required, String] :policy_arn
      #   The Amazon Resource Name (ARN) of the IAM policy you want to attach.
      #
      #   For more information about ARNs, see [Amazon Resource Names (ARNs) and
      #   AWS Service Namespaces][1] in the *AWS General Reference*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html
      # @return [EmptyStructure]
      def attach_policy(options = {})
        options = options.merge(group_name: @name)
        resp = @client.attach_group_policy(options)
        resp.data
      end

      # @param [Hash] options ({})
      # @option options [String] :path
      #   The path to the group. For more information about paths, see [IAM
      #   Identifiers][1] in the *IAM User Guide*.
      #
      #   This parameter is optional. If it is not included, it defaults to a
      #   slash (/).
      #
      #   The [regex pattern][2] for this parameter is a string of characters
      #   consisting of either a forward slash (/) by itself or a string that
      #   must begin and end with forward slashes, containing any ASCII
      #   character from the ! (\\u0021) thru the DEL character (\\u007F),
      #   including most punctuation characters, digits, and upper and
      #   lowercased letters.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html
      #   [2]: http://wikipedia.org/wiki/regex
      # @return [Group]
      def create(options = {})
        options = options.merge(group_name: @name)
        resp = @client.create_group(options)
        Group.new(
          name: options[:group_name],
          data: resp.data.group,
          client: @client
        )
      end

      # @param [Hash] options ({})
      # @option options [required, String] :policy_name
      #   The name of the policy document.
      #
      #   The [regex pattern][1] for this parameter is a string of characters
      #   consisting of upper and lowercase alphanumeric characters with no
      #   spaces. You can also include any of the following characters: =,.@-
      #
      #
      #
      #   [1]: http://wikipedia.org/wiki/regex
      # @option options [required, String] :policy_document
      #   The policy document.
      #
      #   The [regex pattern][1] for this parameter is a string of characters
      #   consisting of any printable ASCII character ranging from the space
      #   character (\\u0020) through end of the ASCII character range
      #   (\\u00FF). It also includes the special characters tab (\\u0009), line
      #   feed (\\u000A), and carriage return (\\u000D).
      #
      #
      #
      #   [1]: http://wikipedia.org/wiki/regex
      # @return [GroupPolicy]
      def create_policy(options = {})
        options = options.merge(group_name: @name)
        resp = @client.put_group_policy(options)
        GroupPolicy.new(
          group_name: @name,
          name: options[:policy_name],
          client: @client
        )
      end

      # @param [Hash] options ({})
      # @return [EmptyStructure]
      def delete(options = {})
        options = options.merge(group_name: @name)
        resp = @client.delete_group(options)
        resp.data
      end

      # @param [Hash] options ({})
      # @option options [required, String] :policy_arn
      #   The Amazon Resource Name (ARN) of the IAM policy you want to detach.
      #
      #   For more information about ARNs, see [Amazon Resource Names (ARNs) and
      #   AWS Service Namespaces][1] in the *AWS General Reference*.
      #
      #
      #
      #   [1]: http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html
      # @return [EmptyStructure]
      def detach_policy(options = {})
        options = options.merge(group_name: @name)
        resp = @client.detach_group_policy(options)
        resp.data
      end

      # @param [Hash] options ({})
      # @option options [required, String] :user_name
      #   The name of the user to remove.
      #
      #   The [regex pattern][1] for this parameter is a string of characters
      #   consisting of upper and lowercase alphanumeric characters with no
      #   spaces. You can also include any of the following characters: =,.@-
      #
      #
      #
      #   [1]: http://wikipedia.org/wiki/regex
      # @return [EmptyStructure]
      def remove_user(options = {})
        options = options.merge(group_name: @name)
        resp = @client.remove_user_from_group(options)
        resp.data
      end

      # @param [Hash] options ({})
      # @option options [String] :new_path
      #   New path for the IAM group. Only include this if changing the group's
      #   path.
      #
      #   The [regex pattern][1] for this parameter is a string of characters
      #   consisting of either a forward slash (/) by itself or a string that
      #   must begin and end with forward slashes, containing any ASCII
      #   character from the ! (\\u0021) thru the DEL character (\\u007F),
      #   including most punctuation characters, digits, and upper and
      #   lowercased letters.
      #
      #
      #
      #   [1]: http://wikipedia.org/wiki/regex
      # @option options [String] :new_group_name
      #   New name for the IAM group. Only include this if changing the group's
      #   name.
      #
      #   The [regex pattern][1] for this parameter is a string of characters
      #   consisting of upper and lowercase alphanumeric characters with no
      #   spaces. You can also include any of the following characters: =,.@-
      #
      #
      #
      #   [1]: http://wikipedia.org/wiki/regex
      # @return [Group]
      def update(options = {})
        options = options.merge(group_name: @name)
        resp = @client.update_group(options)
        Group.new(
          name: options[:new_group_name],
          client: @client
        )
      end

      # @!group Associations

      # @param [Hash] options ({})
      # @option options [String] :path_prefix
      #   The path prefix for filtering the results. This parameter is optional.
      #   If it is not included, it defaults to a slash (/), listing all
      #   policies.
      #
      #   The [regex pattern][1] for this parameter is a string of characters
      #   consisting of either a forward slash (/) by itself or a string that
      #   must begin and end with forward slashes, containing any ASCII
      #   character from the ! (\\u0021) thru the DEL character (\\u007F),
      #   including most punctuation characters, digits, and upper and
      #   lowercased letters.
      #
      #
      #
      #   [1]: http://wikipedia.org/wiki/regex
      # @return [Policy::Collection]
      def attached_policies(options = {})
        batches = Enumerator.new do |y|
          options = options.merge(group_name: @name)
          resp = @client.list_attached_group_policies(options)
          resp.each_page do |page|
            batch = []
            page.data.attached_policies.each do |a|
              batch << Policy.new(
                arn: a.policy_arn,
                client: @client
              )
            end
            y.yield(batch)
          end
        end
        Policy::Collection.new(batches)
      end

      # @param [Hash] options ({})
      # @return [GroupPolicy::Collection]
      def policies(options = {})
        batches = Enumerator.new do |y|
          options = options.merge(group_name: @name)
          resp = @client.list_group_policies(options)
          resp.each_page do |page|
            batch = []
            page.data.policy_names.each do |p|
              batch << GroupPolicy.new(
                group_name: @name,
                name: p,
                client: @client
              )
            end
            y.yield(batch)
          end
        end
        GroupPolicy::Collection.new(batches)
      end

      # @param [String] name
      # @return [GroupPolicy]
      def policy(name)
        GroupPolicy.new(
          group_name: @name,
          name: name,
          client: @client
        )
      end

      # @param [Hash] options ({})
      # @return [User::Collection]
      def users(options = {})
        batches = Enumerator.new do |y|
          options = options.merge(group_name: @name)
          resp = @client.get_group(options)
          resp.each_page do |page|
            batch = []
            page.data.users.each do |u|
              batch << User.new(
                name: u.user_name,
                data: u,
                client: @client
              )
            end
            y.yield(batch)
          end
        end
        User::Collection.new(batches)
      end

      # @deprecated
      # @api private
      def identifiers
        { name: @name }
      end
      deprecated(:identifiers)

      private

      def extract_name(args, options)
        value = args[0] || options.delete(:name)
        case value
        when String then value
        when nil then raise ArgumentError, "missing required option :name"
        else
          msg = "expected :name to be a String, got #{value.class}"
          raise ArgumentError, msg
        end
      end

      class Collection

        include Aws::Resources::Collection

        # @return [Enumerator<Group>]
        def each(&block)
          enum = super
          enum.each(&block) if block
          enum
        end

      end
    end
  end
end