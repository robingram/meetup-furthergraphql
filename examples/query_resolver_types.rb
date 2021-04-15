
module Types
  class QueryType < Types::BaseObject

    # Inline function with same name as field
    field :posts, [Types::Posts::Post], null: false,
      description: "List all posts"
    def posts
      Post.all
    end

    # Resolver callable
    field :post, Types::Posts::PostType do
      description "a post"
      argument :id, ID, null: false
      resolve -> (obj, args, ctx) {
        Post.find(args[:id])
      }
    end

    # Function class
    field :region, function: FindRecord.new(model_class: Region, type: Types::RegionType)

    # Resolver class
    field :post, resolver: Resolvers::Posts::Post
end

class FindRecord < GraphQL::Function
  attr_reader :type

  def initialize(model_class:, type:)
      @model_class = model_class
      @type = type
  end

  argument :id, !GraphQL::ID_TYPE

  def call(obj, args, ctx)
      @model_class.find(args[:id])
  end
end

module Resolvers
  module Posts
    class Posts < Resolvers::BaseResolver
      description 'Returns all posts'

      type [Types::Posts::Post]

      def resolve
        Post.all
      end
    end
  end
end

