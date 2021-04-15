
module Types
  # Base type for all queries
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

    # Function class (deprecated)
    field :region, function: FindPost.new

    # Resolver class
    field :post, resolver: Resolvers::Posts::Post
end

app/graphql/functions/posts/find_post.rb
class FindPost < GraphQL::Function
  argument :id, !GraphQL::ID_TYPE

  def call(obj, args, ctx)
      Post.find(args[:id])
  end
end

# app/graphql/resolvers/posts/posts.rb
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

