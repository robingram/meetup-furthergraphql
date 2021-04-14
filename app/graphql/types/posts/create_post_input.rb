module Types
  module Posts
    class CreatePostInput < Types::BaseInputObject
      description "Attributes for creating a new post"
      argument :title, String, "Title of the post", required: true
      argument :content, String, "Body of the post", required: false
      argument :publication_date, GraphQL::Types::ISO8601Date, required: false
    end
  end
end
