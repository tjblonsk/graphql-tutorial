QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root for this schema"

  field :movie do
    type MovieType
    argument :id, !types.ID
    resolve -> (obj, args, ctx) {
      if args[:year]
        Movie.where(year: args[:year])
      elsif args[:id]
        Movie.find(args[:id])
      else
        Movie.all
      end
    }
  end

  field :actor do
    type ActorType
    argument :id, !types.ID
    resolve -> (obj, args, ctx) {
      Actor.find(args[:id])
    }
  end
end
