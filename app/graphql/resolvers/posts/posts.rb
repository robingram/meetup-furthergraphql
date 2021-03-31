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
