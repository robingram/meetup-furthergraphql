module Resolvers
  module Posts
    class Post < Resolvers::BaseResolver
      description 'Returns a post by ID'
      argument :post_id, ID, required: true

      type Types::Posts::Post

      def resolve(post_id:)
        ::Post.find(post_id)
      end
    end
  end
end
