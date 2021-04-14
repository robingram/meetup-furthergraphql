module Mutations
  module Posts
    class CreatePost < Mutations::BaseMutation
      argument :input, Types::Posts::CreatePostInput, required: true

      type Types::Posts::CreatePostPayload

      def resolve(input:)
        {
          post: Post.create(
            title: input[:title],
            content: input[:content],
            publication_date: input[:publication_date]
          )
        }

      end
    end
  end
end
