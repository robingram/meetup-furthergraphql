module Resolvers
  class BaseResolver < GraphQL::Schema::Resolver
    extend GraphQL::Schema::Resolver::HasPayloadType
  end
end
