module Types
  module Posts
    class CreatePostPayload < Types::BaseObject
      description "Success result for creating a new post"
      field :post, Types::Posts::Post, "The new post", null: false
    end
  end
end
