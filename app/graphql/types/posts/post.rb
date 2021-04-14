module Types
  module Posts
    class Post < Types::BaseObject
      graphql_name "Post"
      description "A blog article"

      field :id, ID, null: false
      field :title, String, null: true
      field :content, String, null: true
      field :publication_date, GraphQL::Types::ISO8601Date, null: true
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
      field :comments, [Types::Comments::Comment], null: false
    end
  end
end
