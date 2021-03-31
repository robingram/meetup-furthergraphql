module Types
  module Comments
    class Comment < GraphQL::Schema::Object
      graphql_name "Comment"
      description "A comment on a Post"

      field :id, ID, null: false
      field :author, String, null: true
      field :content, String, null: true
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
end
